class Canvas < ActiveRecord::Base
  attr_accessible :title, :user

  belongs_to :user
  has_many :blocks

  validates_presence_of :user

  after_create do
    9.times do |acc|
      Block.create(canvas_id: self.id, id_case: acc+1, content: "content#{acc}")
    end
  end

  def content_of_block(index)
    Block.find_by_canvas_id_and_id_case(self.id,index).content  
  end

end
