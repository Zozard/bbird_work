require 'spec_helper'

# Factory can't be tested because of 
# auto creation with canvas


describe Block do

  before(:each) do
    @attr = { id_case: 1, canvas_id: 1, content: "Hello" } 
  end

  it "must be valid" do
    Block.new(@attr).should be_valid
  end

  describe "#id_case" do
    it "is present" do
      @attr[:id_case]=nil
      Block.new(@attr).should_not be_valid
    end

    it "has not twice the same value for the same canvas_id" do
      Block.create(@attr)
      Block.new(@attr).should_not be_valid
    end

    it "can have the same value for two different canvas" do
      Block.create(@attr)
      Block.new(@attr.merge({:canvas_id => 2})).should be_valid
    end

    it "can only take value between 1 and 9" do
      Block.new(@attr.merge({id_case: 0})).should_not be_valid
      Block.new(@attr.merge({id_case: 10})).should_not be_valid
    end

  end

end
