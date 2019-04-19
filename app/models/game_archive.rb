class GameArchive < ApplicationRecord
  belongs_to :user
  has_many :game_items

  validates :game_name, presence: true
end
