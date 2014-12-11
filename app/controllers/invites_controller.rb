class InvitesController < ApplicationController
  def new
    @team = Team.find_by_title(params[:team_id])
  end

  def index
    @user = User.find_by_username(params[:user_id])
    unless @user == current_user
      redirect_to user_path(@user.username)
    end
    @invites = Invite.where(user_id: @user.id)
  end

  def show
    @crew = Crew.find_by(game: params[:game])
  end

  def create
    team = Team.find_by_title(params[:team_id])
    user = User.find_by_username(params[:username])
    if user
      unless user.team
        if Invite.where(user_id: user.id, team_id: team.id).empty?
          Invite.create(user_id: user.id, team_id: team.id)
          flash[:notice] = "Приглашение пользователю «<b>#{user.username}</b>» отправлено."
          render json: { url: team_path(team.title) }
        else
          render json: { error: 'Вы уже отправляли приглашение этому пользователю!'}
        end
      else
        render json: { error: 'Этот пользователь уже состоит в другой команде!'}
      end
    else
      render json: { error: 'Пользователь с таким ником не зарегистрирован!'}
    end
  end

  def destroy
    invite = Invite.find(params[:id])
    team = invite.team
    if current_user.id = invite.user_id
      if params[:join] == 'true'
        current_user.update(team_id: team.id)
        invite.destroy
        flash[:notice] = "Вы вступили в команду «<b>#{team.title}</b>»."
        redirect_to team_path(team.title)
      else
        invite.destroy
        flash[:notice] = "Приглашение в команду «<b>#{team.title}</b>» отклонено."
        redirect_to user_path(current_user.username)
      end
    else
      head 403
    end
  end
end
