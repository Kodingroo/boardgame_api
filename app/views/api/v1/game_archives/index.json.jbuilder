json.array! @game_archives do |game_archive|
  json.extract! game_archive, :game_name, :game_rank, :bgg_link, :playing_time, :image_url, :thumb_url
  
  json.game_categories game_archive.game_categories, :category_name
  json.game_mechanics game_archive.game_mechanics, :mechanic_name
  json.game_designers game_archive.game_designers, :designer_name

  # json.game_items game_archive.game_items do |game_item|
  #   json.extract! game_item, :id, :description
  # end
end
