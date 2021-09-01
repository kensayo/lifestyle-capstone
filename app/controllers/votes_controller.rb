class VotesController < ApplicationController
  def vote
    @vote = Vote.new user_id: current_user.id, recipe_id: params[:recipe_id]
    if @vote.save
      redirect_back(fallback_location: root_path, notice: 'You voted this post')
    else
      redirect_back(fallback_location: root_path, alert: "You've already voted for this post")
    end
  end
end
