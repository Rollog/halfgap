require 'spec_helper'

# In order to chat with friends,
# as a user
# I want to send a message

# Scenario 1: Success
# When I login to my user profile
# and I message a friend I want to talk to
# and I hit enter
# Then the page should display the
# message sent

feature "user sends an instant message", js: true do
  before :each do
    User.create(name: 'user@example.com', password: 'caplin')
  end

  context "successfully" do
    scenario "sending a instant message" do
      visit(user_path(User.first))  #user_path

      fill_in 'user_name', with: 'Marc'
      fill_in 'message', with: 'hi there!'

      click_button 'Send'

      # expect(page).to have_content 'Marc'
      expect(page).to have_content 'hi there!'

    end
  end

end