require 'spec_helper'

feature "Signin in " do
  
  let(:user) { FactoryGirl.create(:user) }
  
  scenario "redirects to canvas after successful identification" do
    visit new_user_session_path 
    within("form#new_user.new_user") do
      fill_in 'user_email', :with => user.email 
      fill_in 'Password', :with => user.password
    end
    click_on 'Sign in'
    current_path.should == canvas_path 
  end

  it "redirects identified users to canvas" do
    login_as(user, :scope => :user)
    visit root_path 
    current_path.should == canvas_path
  end

  it "canvas can't be accessed to visitors" do
    visit canvas_path 
    current_path.should == new_user_session_path
  end

end
