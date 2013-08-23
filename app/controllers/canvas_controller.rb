class CanvasController < ApplicationController
  
  before_filter :authenticate_user!
  
  def show
    @blocks=Block.where(canvas_id: params[:id])
    @tweets=Tweet.where(canvas_id: params[:id])
  end

  def index
    @canvas=Canvas.all
  end
end
