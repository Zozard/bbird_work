require 'spec_helper'

feature "Canvas display" do

  let(:canvas) { FactoryGirl.create(:canvas) }

  background do
    login_as(canvas.user, :scope => :user)
    visit canva_path(canvas)
  end

  after(:each) do
    Warden.test_reset!
  end

  scenario "each box contains content of blocks in DB" do
    all("td").each_with_index do |td, index|
      td.should have_content(canvas.content_of_block(index+1))
    end
  end

  scenario "if js active, submit button is hidden", :js => true do
    within('form#block_1') do
      # Par défaut Capybara ne tient pas compte des éléments invisibles
      find_button('Submit', :visible => false).should_not be_visible
    end
  end

  scenario "textareas make changes in database" do
    within("form#block_1") do
      fill_in 'block_content', :with => '123456789'
      click_on 'Submit'
    end
    canvas.content_of_block(1).should have_content('123456789')
  end
end
