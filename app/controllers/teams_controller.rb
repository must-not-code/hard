class TeamsController < ApplicationController
  def index
    @teams = Team.where(game: 'lol')
  end

  def show
    @team = Team.find_by(game: params[:game])
  end
end
