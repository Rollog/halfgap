require 'spec_helper'

# In order to create an account,
# as a user
# I want to create an account

# Scenario 1: Success
# When I create a user
# and I add a name, email, password, & password confirmation
# and I click 'Create Account'
# Then the page should display the
# name and email
# and the user is saved

feature "user creates account", js: true do
  
  context "successfully" do
    scenario "creating an account" do
      visit '/users/new'  #new_user_path

      fill_in 'Name', with: 'Marc'
      fill_in 'Email', with: 'marc@me.com'
      fill_in 'Password', with: 'joxersboxers'
      fill_in 'Confirm Password', with: 'joxersboxers'

      click_button 'Create Account'

      expect(current_path).to eql user_path(User.last)

      expect(page).to have_content 'Marc'
      expect(page).to have_content 'marc@me.com'

      expect(User.last.name).to eql 'Marc'
    end
  end

end