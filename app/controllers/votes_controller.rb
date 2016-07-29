class VotesController < ApplicationController
  def create
    vote = Vote.new
    vote.link_id = params[:vote][:link_id]
    redirect_to :back
  end
end
