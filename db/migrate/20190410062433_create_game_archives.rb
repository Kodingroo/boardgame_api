class CreateGameArchives < ActiveRecord::Migration[5.2]
  def change
    create_table :game_archives do |t|
      t.string :game_name
      t.integer :game_rank
      t.string :bgg_link
      t.integer :playing_time
      t.string :category
      t.string :mechanic
      t.string :designer
      t.string :image_url
      t.string :thumb_url
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
