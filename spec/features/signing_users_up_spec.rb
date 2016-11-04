require 'rails_helper'

RSpec.feature "User Sign Up" do

    scenario 'User Signs up with valid credentials' do
        
        visit '/'
        click_link "Sign Up"
        
        fill_in "Email", with: "two@example.com"
        fill_in "Password", with: "password"
        fill_in "Password confirmation", with: "password"
        
        click_button "Sign Up"
        
        
        expect(page).to have_content("Welcome! You have signed up successfully.")
        
        
        
    end
end