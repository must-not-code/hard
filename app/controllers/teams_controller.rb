class TeamsController < ApplicationController
  def new
    @user = current_user
    @team = Team.new
  end

  def create
    if logged_in?
      @team = Team.new(owner:   current_user.username,
                       title:   params['team']['title'],
                       tag:     params['team']['tag'],
                       country: params['team']['country'],
                       site:    params['team']['site'],
                       vk:      params['team']['vk'],
                       fb:      params['team']['fb'],
                       twitter: params['team']['twitter'],
                       youtube: params['team']['youtube'],
                       logo:    params['file']['0'])
      if @team.save
        current_user.update(team_id: @team.id)
        flash[:notice] = "Команда «<b>#{@team.title}</b>» создана."
        render json: { success: true, url: team_path(@team.title) }
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
                      country: params['team']['country'],
                      site:    params['team']['site'],
                      vk:      params['team']['vk'],
                      fb:      params['team']['fb'],
                      twitter: params['team']['twitter'],
                      youtube: params['team']['youtube'],
                      logo:    params['file']['0'])
        flash[:notice] = 'Данные обновлены.'
        render json: { success: true, url: team_path(@team.title) }
      else
        render json: { error: @team.errors.first[1] }
      end
    else
      head 403
    end
  end

  def leave
    @team = Team.find_by_title(params[:team_id])
    if logged_in? && current_user.team_id == @team.id
      current_user.update(team_id: nil)
      flash[:notice] = "Вы покинули команду «<b>#{@team.title}</b>»!"
      redirect_to user_path(current_user.username)
    else
      head 403
    end
  end

  def destroy
    @team = Team.find_by_title(params[:id])
    if logged_in? && current_user.username == @team.owner
      @team.users.update_all(team_id: nil)
      @team.destroy
      flash[:notice] = 'Ваша команда удалена!'
      redirect_to user_path(current_user.username)
    else
      head 403
    end
  end
end
