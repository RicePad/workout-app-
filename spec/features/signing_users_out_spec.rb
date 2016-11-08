require 'rails_helper'

RSpec.feature "Signing Users Out" do

    before do 
        @john = User.create(email: "two@example.com", password: "password", password_confirmation: "password")
        login_as(@john)
    end
    

    scenario 'User Logs out' do
        visit '/'
        
        click_link "Log out"
        
        expect(page).to have_content("Signed out successfully.")
    end

end