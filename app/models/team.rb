class Team < ApplicationRecord
  has_many :players
  has_many :tournaments
  has_many :competitions, through: :tournaments
end
