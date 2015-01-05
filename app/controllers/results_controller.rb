class ResultsController < ApplicationController
  def create
    @tournament = Tournament.find(params[:tournament_id])
    if logged_in? &&
    (@tournament.users.find_by(id: current_user.id) ||
    current_user.group[/admin|newsman/]) &&
    @tournament.beginning < Time.now
      @result = Result.new(content:       params[:text],
                           user_id:       current_user.id,
                           tournament_id: params[:tournament_id])
      if @result.save
        render json: { div: '#results', load: tournament_results_path(@tournament.id) }
      else
        render json: { error: @result.errors.first[1] }
      end
    else
      head 403
    end
  end
end
