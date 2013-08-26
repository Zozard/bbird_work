class Block < ActiveRecord::Base
  attr_accessible :content, :id_case, :canvas_id

  validates_presence_of :id_case, :canvas_id

  validates_uniqueness_of :id_case, :scope => :canvas_id

  validates_inclusion_of :id_case, :in => 1..9

  belongs_to :canvas

end
