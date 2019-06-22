class GameArchive < ApplicationRecord
  belongs_to :user
  has_many :game_items
  has_many :game_categories
  has_many :game_mechanics

  validates :game_name, presence: true
end
