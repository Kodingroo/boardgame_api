class CreateGameCategories < ActiveRecord::Migration[5.2]
    def change
        create_table :game_categories do |t|
            t.string :category_name
            t.references :game_archive
        end
        remove_column :game_archives, :category
    end
end
        