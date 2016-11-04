require 'rails_helper'

RSpec.feature "Signing Users Out" do

    before do 
        @john = User.create(email: "two@example.com", password: "password", password_confirmation: "password")
    
    
  
        visit '/'
        
        click_link "Log in"
        fill_in "Email", with: @john.email
        fill_in "Password", with: @john.password
        
         click_button "Log in"
        
         expect(page).to have_content("Signed in successfully.")
         expect(page).to have_content("Signed in as #{@john.email}")


    end
    

    scenario 'User Logs out' do
        visit '/'
        
        click_link "Log out"
        
        expect(page).to have_content("Signed out successfully.")
    end

end