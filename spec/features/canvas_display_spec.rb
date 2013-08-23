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
    all("td.block").each_with_index do |block, index|
      block.should have_content(canvas.content_of_block(index+1))
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

feature "Tweets drag and drop" do


  let(:canvas) { FactoryGirl.create(:canvas) }
  let(:tweets) { Tweet.where(canvas_id: canvas.id) }

  before(:each) do 
    FactoryGirl.create(:tweet, canvas_id: canvas.id)
    FactoryGirl.create(:tweet, canvas_id: canvas.id)
  end

  background do
    login_as(canvas.user, :scope => :user)
    visit canva_path(canvas)
  end

  scenario "all tweets having this canvas_id are displayed" do
    tweets.each do |t|
      page.find("div#basket").should have_content(t.text)
    end
  end

  scenario "tweets are draggable", :js => true do
    all(".draggable").each do |t|
      t[:class].should have_content('ui-draggable')
    end
  end

  scenario "blocks are droppable", :js => true do
    all(".block").each do |b|
      b[:class].should have_content('ui-droppable')
    end
  end

  scenario "dropped tweets have an associated id_case"do
    pending 
  end

end
