require 'spec_helper'

feature "canvas" do

  background do
    u=User.new(email: 'user@example.com', password: 'password', name: 'denis')
    @c=Canvas.create(title: "Noisy Keychains", user: u)
    login_as(u, :scope => :user)
    visit '/canvas/'+@c.id.to_s
  end

  after(:each) do
    Warden.test_reset!
  end

  scenario "each 9 <td> contains respectively contents of 9 blocks" do
    all("td").each_with_index do |td, index|
      td.should have_content(@c.content_of_block(index+1))
    end
  end

  scenario "if js active, submit button is hidden", :js => true do
    within('form#block_1') do
      # Par défaut Capybara ne tient pas compte des éléments invisibles
      find_button('Submit', :visible => false).should_not be_visible
    end
  end

      scenario "textareas make changes in database for the first block" do
        within("form#block_1") do
          fill_in 'block_content', :with => '123456789'
          click_on 'Submit'
        end
        @c.content_of_block(1).should have_content('123456789')
      end
end
