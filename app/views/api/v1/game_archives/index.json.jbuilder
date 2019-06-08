json.array! @game_archives do |game_archive|
  json.extract! game_archive, :game_name, :game_rank, :bgg_link, :playing_time, :category, :mechanic, :designer, :image_url, :thumb_url
  # json.game_items game_archive.game_items do |game_item|
  #   json.extract! game_item, :id, :description
  # end
end
