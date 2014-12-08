class TeamsController < ApplicationController
  def new
    @user = current_user
    @team = Team.new
  end

  def create
  end

  def show
    @team = Team.find_by_title(params[:id])
  end
end
