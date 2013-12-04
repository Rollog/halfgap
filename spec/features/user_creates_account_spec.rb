require 'spec_helper'

# In order to create an account,
# as a user
# I want to create an account

# Scenario 1: Success
# When I add a species
# and I add a color
# and I click 'save'
# Then the page should display the
# color and species
# and the animal is saved

feature "user creates account", js: true do
  
  context "successfully" do
    scenario "creating an account" do
      visit '/users/new'  #new_user_path

      fill_in 'Name', with: 'Marc'
      fill_in 'Email', with: 'marc@me.com'
      fill_in 'Password', with: 'joxersboxers'
      fill_in 'Confirm Password', with: 'joxersboxers'

      click_button 'Create Account'

      expect(current_path).to eql user_path(User.first)

      expect(page).to have_content 'Marc'
      expect(page).to have_content 'marc@me.com'
      # expect(page).to have_content 'Animal created!'

      expect(User.first.name).to eql 'Marc'
    end
  end

end