class CreateGameItems < ActiveRecord::Migration[5.2]
  def change
    create_table :game_items do |t|
      t.text :description
      t.references :game_archive, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
