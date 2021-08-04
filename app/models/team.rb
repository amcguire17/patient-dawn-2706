class Team < ApplicationRecord
  has_many :players
  has_many :tournaments
  has_many :competitions, through: :tournaments

  def self.order_players_average_age
    joins(:players).select('teams.*, avg(players.age) as average_age').group(:id).order('average_age DESC')
  end
end
