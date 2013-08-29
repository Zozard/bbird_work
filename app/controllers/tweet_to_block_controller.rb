class BlocksController < ApplicationController
  def create
    tb=TweetToBlock.create(id_case: params[:block], tweet_id: params[:tweet])
    redirect_to "/canvas/"+Tweet.find(tb.tweet_id).canvas_id
  end
end
