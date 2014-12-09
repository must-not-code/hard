class TeamsController < ApplicationController
  def new
    @user = current_user
    @team = Team.new
  end

  def create
    if logged_in?
      @team = Team.new(owner: current_user.username,
                       title: params['team']['title'],
                       tag: params['team']['tag'])
      if @team.save
        current_user.update(team_id: @team.id)
        flash[:notice] = "Команда «<b>#{@team.title}</b>» создана."
        render js: "window.location.pathname='#{team_path(@team.title)}'"
      else
        render json: { error: @team.errors.first[1] }
      end
    else
      head 403
    end
  end

  def show
    @team = Team.find_by_title(params[:id])
  end

  def edit
    @team = Team.find_by_title(params[:id])
    unless logged_in? && current_user.username == @team.owner
      redirect_to team_path
    end
  end

  def update
    @team = Team.find(params[:id])
    if logged_in? && current_user.username == @team.owner
      if @team.update(title:   params['team']['title'],
                      tag:     params['team']['tag'],
                      site:    params['team']['site'],
                      vk:      params['team']['vk'],
                      fb:      params['team']['fb'],
                      twitter: params['team']['twitter'],
                      youtube: params['team']['youtube'],
                      logo:    params['file']['0'])
        flash[:notice] = 'Данные обновлены.'
        render json: { success: true }
      else
        render json: { error: @team.errors.first[1] }
      end
    else
      head 403
    end
  end
end
