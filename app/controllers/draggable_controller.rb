class DraggableController < ApplicationController
  def update
    b=Block.find(params[:block_id])
    b.tweets << Tweet.find(params[:tweet_id])
    redirect_to "/canvas/"+params[:id]
  end
end
