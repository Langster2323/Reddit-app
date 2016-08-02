class VotesController < ApplicationController
  def create
    vote = Vote.new(link_id: params[:link_id])
    # vote.link_id = params[:vote][:link_id]
    vote.save
    redirect_to :back
  end
end
