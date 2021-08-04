class TournamentsController < ApplicationController
  def new
    @competition = Competition.find(params[:id])
  end
  def create
    @competition = Competition.find(params[:id])
    @competition.teams << Team.create!(team_params)
    redirect_to "/competitions/#{@competition.id}"
  end
  private
  def team_params
    params.permit(:hometown, :nickname)
  end
end
