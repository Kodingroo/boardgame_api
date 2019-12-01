class GameItem < ApplicationRecord
  belongs_to :game_archive
  belongs_to :user

  p "tesitng"

  p "Im doing more testing"
end
