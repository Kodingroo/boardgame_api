json.extract! @game_archive, :id, :game_name, :game_rank, :playing_time, :category, :mechanic, :designer, :image_url, :thumb_url
json.game_items @game_archive.game_items do |game_item|
  json.extract! game_item, :id, :description
  json.user do
      json.id game_item.user.id
      json.email game_item.user.email
  end
end
