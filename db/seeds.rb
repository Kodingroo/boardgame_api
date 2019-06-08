require 'nokogiri'
require 'open-uri'

GameArchive.destroy_all if Rails.env.development?
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

      bgcategory_array = []
      xml_doc.search('[type="boardgamecategory"]').each do |ele|
        if ele.nil?
          bgcategory_array << "n/a"
        else  
          bgcategory = {}
          bgcategory[:id] = ele['id']
          bgcategory[:name] = ele['value']
          bgcategory_array << bgcategory[:name]
        end
        # bgcategory_array << ele.values[2]
      end

      game[:category] = bgcategory_array

      bgmechanic_array = []
      xml_doc.search('[type="boardgamemechanic"]').each do |ele|
        if ele.nil?
          bgmechanic_array << "n/a"
        else  
          bgmechanic = {}
          bgmechanic[:id] = ele['id']
          bgmechanic[:name] = ele['value']
          bgmechanic_array << bgmechanic[:name]
        end
        # bgmechanic_array << ele.values[2]
      end

      game[:mechanic] = bgmechanic_array

      bgdesigner_array = []
      xml_doc.search('[type="boardgamedesigner"]').each do |ele|
        if ele.nil?
          bgdesigner_array << "n/a"
        else  
          bgdesigner = {}
          bgdesigner[:id] = ele['id']
          bgdesigner[:name] = ele['value']
          bgdesigner_array << bgdesigner[:name]
        end
        # bgdesigner_array << ele.values[2]
      end

      game[:designer] = bgdesigner_array

      xml_doc.search('image').each do |ele|
        if ele.nil?
          game[:image_url] = "n/a"
        else  
          game[:image_url] = ele.text
        end
        # game[:image_url] = ele.text
      end

      thumb_image = xml_doc.search('thumbnail').each do |ele|
        if ele.nil?
          game[:thumb_url] = "n/a"
        else  
          game[:thumb_url] = ele.text
        end
        # game[:thumb_url] = ele.text
      end

      unless game[:game_name].nil?
        p game
        GameArchive.create!(game)
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
