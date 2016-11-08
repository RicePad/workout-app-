require 'rails_helper'

RSpec.feature "Signing Users In" do 
    
      before do 
        @john = User.create(email: "two@example.com", password: "password", password_confirmation: "password")
     end
    
    scenario 'Users Signs In with valid credentials' do
        visit '/'
        
        click_link "Log in"
        fill_in "Email", with: @john.email
        fill_in "Password", with: @john.password
        
         click_button "Log in"
        
         expect(page).to have_content("Signed in successfully.")
         expect(page).to have_content("Signed in as #{@john.email}")


        
    end

end