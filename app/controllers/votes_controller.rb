class VotesController < ApplicationController
  def create
    vote = Vote.new
    vote.link_id = params[:vote][:link_id]
    vote.save
    redirect_to :back
  end
end
