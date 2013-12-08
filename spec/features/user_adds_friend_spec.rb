require 'spec_helper'

# In order to create a friendship
# as a user
# I want to add a friendship

# Scenario 1: Success
# When I add a friendship
# and I click add
# Then the page should display 
# friends that are added
# and the friendship is saved

feature "user adds friend", js: true do
  before :each do
    User.create(name: 'Randy', password: 'caplin')
  end

	context "successfully" do
		scenario "user adds friend" do
			visit(users_path)  #users_path

			expect(page).to have_content 'Randy'

			click_link 'Add Friend'
		end
	end
end