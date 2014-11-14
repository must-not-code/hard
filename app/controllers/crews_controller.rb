class CrewsController < ApplicationController
  def index
    @crews = Crew.where(game: 'lol')
  end

  def show
    @crew = Crew.find_by(game: params[:game])
  end
end
