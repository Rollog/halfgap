require 'spec_helper'

feature "user logs in", js: true do
	before :each do
    User.create(:email => 'marc@me.com', :password => 'joxersboxers')
  end

	context "successfully" do
		scenario "logging in" do
			visit '/authentications/new' #new_authentication_path
			
			fill_in 'Email', with: 'marc@me.com'
      		fill_in 'Password', with: 'joxersboxers'

      		click_button 'Login'

      		# expect(current_path).to eql users_path(User.first)

      		expect(page).to have_content 'marc@me.com'

		end
	end
end