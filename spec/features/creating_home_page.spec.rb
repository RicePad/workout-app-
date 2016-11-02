require 'rails_helper'  

RSpec.feature "Creating Home Page" do
    
    scenario 'Visit Home Page' do
        visit '/'
        
       expect(page).to have_link('Athletes Den')
       expect(page).to have_link('Home')
       expect(poage).to have_link('Workout Loungue')
        
    end

end