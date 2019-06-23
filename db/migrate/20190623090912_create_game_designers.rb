class CreateGameDesigners < ActiveRecord::Migration[5.2]
    def change
        create_table :game_designers do |t|
            t.string :designer_name
            t.references :game_archive
        end
        remove_column :game_archives, :designer
    end
end
        