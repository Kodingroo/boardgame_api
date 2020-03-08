require 'nokogiri'
require 'open-uri'

GameArchive.destroy_all if Rails.env.development?
GameCategory.destroy_all if Rails.env.development?
GameItem.destroy_all if Rails.env.development?

# GAMES DATABASE

ranked_titles = []

def get_titles(pages_count)
  game_rank_counter = 1
  pages_count = pages_count.to_a

  pages_count.each_with_index do |_page, index|

    url = "https://boardgamegeek.com/browse/boardgame/page/#{_page}"

    (1..100).each_with_index do |_item, index|

      # SCRAPE WEBSITE

      html_data = open(url).read
      html_doc = Nokogiri::HTML(html_data)
      game = {}

      name_array = []
      name_link = html_doc.search("#results_objectname#{_item} > a").inner_text
      if name_link.nil?
        name_array = "n/a"
      else
        name_array << name_link.delete_prefix('"').delete_suffix('"')
      end

      game[:user_id] = 1
      game[:game_name] = name_array[0]
      game[:game_rank] = game_rank_counter
      game_rank_counter += 1
      
      bgg_code = html_doc.search("#results_objectname#{_item} > a")[0]['href'].scan(/game.([0-9]*)/)
      bgg_id = bgg_code[0][0].to_i
      puts "Getting #{game[:game_name]} with id: #{bgg_id}"
      puts "~"

      # PARSE API

      api_url = "https://www.boardgamegeek.com/xmlapi2/thing?id=#{bgg_id}"
      xml_data = open(api_url).read
      xml_doc = Nokogiri::HTML(xml_data)

      game[:bgg_link] = "https://boardgamegeek.com/boardgame/#{bgg_id}"

      playingtime_array = []
      xml_doc.search('playingtime').each do |ele|
        playingtime_array << ele.values.split(',')[0].last.to_i
      end

      game[:playing_time] = playingtime_array[0]

      # trying to add a hash to a game object with a Hash object      
      # game[:category] = Hash.new{|hsh,key| hsh[key] = [] }
      
      # bgcategory_array = []
      # xml_doc.search('[type="boardgamecategory"]').each_with_index do |ele, i|
      #     category_name = {}
      #     category_name[:category_name] = ele['value']  
      #     category_name[:game_archive_id] = game[:game_rank]
      #     GameCategory.create!(category_name)

      #   # if ele.nil?
      #   #   bgcategory_array << "n/a"
      #   # else  
      #   #   category_name = {}
      #   #   bgcategory[:id] = ele['id']
      #   #   bgcategory[:name] = ele['value']
      #   #   # trying to add a hash to a game object with a Hash object
      #   #   game[:category]['k1'].push(ele['value'])
      #   #   # trying to add a hash to the game object with a class
      #   #   # game[:category] = Category.new(ele['value']).name
      #   #   bgcategory_array << bgcategory[:name]
      #   # end
      #   # # bgcategory_array << ele.values[2]
      # end
      
      # game[:category] = new [bgcategory_array.map.each_with_index { |item, index| [index + 1, item] } ]


      # bgmechanic_array = []
      # xml_doc.search('[type="boardgamemechanic"]').each do |ele|
      #   if ele.nil?
      #     bgmechanic_array << "n/a"
      #   else  
      #     bgmechanic = {}
      #     bgmechanic[:id] = ele['id']
      #     bgmechanic[:name] = ele['value']
      #     bgmechanic_array << bgmechanic[:name]
      #   end
      #   # bgmechanic_array << ele.values[2]
      # end

      # game[:mechanic] = Hash[bgmechanic_array.map.with_index { |item, index| [index + 1, item] } ]

      # bgdesigner_array = []
      # xml_doc.search('[type="boardgamedesigner"]').each do |ele|
      #   if ele.nil?
      #     bgdesigner_array << "n/a"
      #   else  
      #     bgdesigner = {}
      #     bgdesigner[:id] = ele['id']
      #     bgdesigner[:name] = ele['value']
      #     bgdesigner_array << bgdesigner[:name]
      #   end
      #   # bgdesigner_array << ele.values[2]
      # end

      # game[:designer] = bgdesigner_array
      # game[:designer] = Hash[bgdesigner_array.map.with_index { |item, index| [index + 1, item] } ]

      xml_doc.search('image').each do |ele|
        if ele.nil?
          game[:image_url] = "n/a"
        else  
          game[:image_url] = ele.text
        end
      end

      thumb_image = xml_doc.search('thumbnail').each do |ele|
        if ele.nil?
          game[:thumb_url] = "n/a"
        else  
          game[:thumb_url] = ele.text
        end
      end

      unless game[:game_name].nil?
        game_data = GameArchive.create!(game)

        xml_doc.search('[type="boardgamecategory"]').each_with_index do |ele, i|
          bgcategory = {}
          bgcategory[:game_archive_id] = game_data[:id]
          bgcategory[:category_name] = ele['value']  
          GameCategory.create!(bgcategory)
        end

        xml_doc.search('[type="boardgamemechanic"]').each do |ele|
          bgmechanic = {}
          bgmechanic[:game_archive_id] = game_data[:id]
          bgmechanic[:mechanic_name] = ele['value']
          GameMechanic.create!(bgmechanic)
        end

        bgdesigner_array = []
        xml_doc.search('[type="boardgamedesigner"]').each do |ele|
            bgdesigner = {}
            bgdesigner[:game_archive_id] = game_data[:id]
            bgdesigner[:designer_name] = ele['value']
            bgdesigner_array << bgdesigner[:name]
            GameDesigner.create!(bgdesigner)
        end

        p game_data
        print "Category: "
        game_data.game_categories.each do |cat|
          print cat.category_name + " "
        end
        p ""
        print "Mechanic: "
        game_data.game_mechanics.each do |mech|
          print mech.mechanic_name + " "
        end
        p ""
        print "Designer: "
        game_data.game_designers.each do |des|
          print des.designer_name + " "
        end
      end

      sleep(5)
      puts "====================================================================="
      puts ""
    end
  end
end

ranked_titles << get_titles(1..5)

puts "Finished seeding database..."
puts ""
