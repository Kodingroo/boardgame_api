class CreateGameMechanics < ActiveRecord::Migration[5.2]
    def change
        create_table :game_mechanics do |t|
            t.string :mechanic_name
            t.references :game_archive
        end
        remove_column :game_archives, :mechanic
    end
end
        