class CanvasController < ApplicationController
  
  before_filter :authenticate_user!
  
  def show
    @blocks=Block.where(canvas_id: params[:id])
    @id_to_name = {1=>"KP", 2=>"KA", 3=>"VP", 4=>"CR", 5=>"CS", 6=>"KR", 7=>"CH", 8=>"C$", 9=>"RS"} 
  end

  def index
    @canvas=Canvas.all
  end
end
