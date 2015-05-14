class CrewsController < ApplicationController
  def index
    @crews = Crew.all
  end

  def show
    @crew = Crew.find_by(game: params[:game])
  end
end
