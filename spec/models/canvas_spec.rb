require 'spec_helper'

describe Canvas do

  it "has a valid factory" do
    FactoryGirl.create(:canvas).should be_valid
    FactoryGirl.build(:canvas).should be_valid
  end

  describe "blocks" do

    let(:canvas) { FactoryGirl.create(:canvas)}

    context "at creation" do
      it "are 9" do
        Block.where(canvas_id: canvas.id).should have(9).items
      end
    end

    it "each have different id_case" do
      b=Block.where(canvas_id: canvas.id).map(&:id_case)
      b.uniq.should == b
    end
  end

  describe "user" do
    it "is present" do
      FactoryGirl.build(:canvas, user: nil).should_not be_valid
    end
  end

end
