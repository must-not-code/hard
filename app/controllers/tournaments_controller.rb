class TournamentsController < ApplicationController
  def index
    @tournaments = Tournament.order(created_at: :desc)
  end

  def show
    @tournament = Tournament.find(params[:id])
    tourney_gon(@tournament.id)
    render 'show', layout: 'tournament'
  end

  def list
    @tournament = Tournament.find(params[:id])
    tourney_gon(@tournament.id)
    render 'list', layout: 'tournament'
  end

  def groups
    @tournament = Tournament.find(params[:id])
    tourney_gon(@tournament.id)
    gon.push({admin: logged_in? ? current_user.group == 'admin' : false,
              update_group_path: tournament_update_groups_path(@tournament.id),
              groups: @tournament.groups})
    render 'groups', layout: 'tournament'
  end

  def bracket
    @tournament = Tournament.find(params[:id])
    tourney_gon(@tournament.id)
    gon.push({admin: logged_in? ? current_user.group == 'admin' : false,
              skip_consolation_round: @tournament.skip_consolation_round,
              tournament_standings_path: tournament_standings_path(@tournament.id),
              tournament_shuffle_path: tournament_shuffle_path(@tournament.id)})
    render 'bracket', layout: 'tournament'
  end

  def results
    @tournament = Tournament.find(params[:id])
    tourney_gon(@tournament.id)
    gon.push({tournament_id: @tournament.id,
              results_path: results_path,
              tournament_results_path: tournament_results_path(@tournament.id)})
    render 'results', layout: 'tournament'
  end

  def update_groups
    if logged_in? && current_user.group[/admin/]
      groups = Tournament.find(params[:id]).groups
      groups[params[:char]] = JSON.parse(params[:json])
      Tournament.find(params[:id]).update(groups: groups)
      head 200
    else
      head 403
    end
  end

  def standings
    if logged_in? && current_user.group[/admin/]
      Tournament.find(params[:id]).update(standings: params[:json])
      head 200
    else
      head 403
    end
  end

  def grid
    render json: Tournament.find(params[:id]).standings
  end

  def signup
    if logged_in?
      user = current_user
      tournament = Tournament.find(params[:id])
      if user.activation_state != 'active'
        render json: {success: false,
                      errors: 'Для участия в турнире вам нужно активировать аккаунт, пройдя по ссылке из письма, отправленного вам при регистрации.'}
      elsif user.skype == '' or user.tag == ''
        render json: {success: false,
                      errors: "Вам необходимо указать свой Skype и BattleTag в <a href='#{user_path(user.username)}'>настройках профиля</a>."}
      elsif tournament.users.find_by(id: user.id)
        render json: {success: false,
                      errors: 'Вы уже записаны на этот турнир.'}
      elsif tournament.sign_up_end < Time.now
        render json: {success: false,
                      errors: 'К сожалению, истекло время для записи на этот турнир.'}
      elsif user.rating <= tournament.passing_score
        render json: {success: false,
                      errors: "Для регистрации в этом турнире ваш рейтинг должен быть #{tournament.rating}+."}
      else
        tournament.users << user
        tournament.save
        user.kinds.find_by(tournament_id: tournament.id).update(kind: params[:kind])
        if tournament.users.count >= 64
          render json: {success: true,
                        msg: 'Превышен лимит игроков. Вы записаны в очередь. Если кто-то из игроков не подтвердит свое участние, то вы сможете занять его место.'}
        else
          render json: {success: true,
                        msg: 'Вы успешно зарегистрированы.'}
        end
      end
    else
      render json: {success: false,
                    errors: 'Для регистрации в турнире необходимо авторизоваться.'}
    end
  end

  def signout
    if logged_in?
      if Tournament.find(params[:id]).sign_up_end < Time.now
          render json: {success: false,
                        errors: 'К сожалению, регистрацию уже нельзя отменить.'}
      else
        Tournament.find(params[:id]).kinds.find_by(user_id: current_user.id).destroy
        render json: {success: true}
      end
    else
      head 403
    end
  end

  def checkin
    if logged_in?
      tournament = Tournament.find(params[:id])
      if tournament.check_in_end < Time.now
        render json: {success: false,
                      errors: 'К сожалению, сетка уже сформирована без вас.'}
      else
        tournament.kinds.find_by(user_id: current_user.id).update(confirm: true)
        render json: {success: true}
      end
    else
      head 403
    end
  end

  def shuffle
    if logged_in? && current_user.group[/admin/]
      seats = Tournament.find(params[:id]).seats
      teams = []
      results = []

      Kind.where(tournament_id: params[:id], confirm: true).first(seats).shuffle.each do |kind|
        user = User.find(kind.user_id).username
        teams << {name: user, flag: kind.kind}
      end

      if teams.count < seats
        placeholder = {name: nil, flag: nil}
        teams = teams.flat_map {|e| [e, placeholder]}
        until teams.count == seats
          teams.delete_at(teams.index(placeholder))
        end
      end

      teams_in_pairs = teams.each_slice(2).to_a
      teams_in_pairs.each do |pair|
        unless pair.last[:name].nil?
          results << [nil,nil]
        else
          results << [1,0]
        end
      end

      bracket = {teams: teams_in_pairs, results: results}
      Tournament.find(params[:id]).update(standings: bracket.to_json)
      head 200
    else
      head 403
    end
  end

  private
  def tourney_gon(id)
    gon.push({tournament_list_path: tournament_list_path(id),
              tournament_signup_path: tournament_signup_path(id),
              tournament_signout_path: tournament_signout_path(id),
              tournament_checkin_path: tournament_checkin_path(id)})
  end
end
