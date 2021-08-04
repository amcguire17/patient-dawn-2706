class Competition < ApplicationRecord
  has_many :tournaments
  has_many :teams, through: :tournaments

  def average_age_players
    teams.joins(:players).select('teams.*, players.*').average(:age)
  end
end
