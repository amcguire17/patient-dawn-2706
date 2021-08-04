class TeamsController < ApplicationController
  def index
    @teams = Team.order_players_average_age
  end
end
