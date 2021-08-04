class Competition < ApplicationRecord
  has_many :tournaments
  has_many :teams, through: :tournaments
end
