require 'rails_helper'

RSpec.feature "Creating Exercise" do
    
    before do 
         @john = User.create(email: "two@example.com", password: "password")
         login_as(@john)
     end
     
     scenario 'with valid inputs' do
         visit '/'
        
        click_link 'My Lounge'
        click_link 'New Workout'
        
        expect(page).to have_link('Back')
     
        fill_in 'Duration', with: 10
        fill_in 'Workout Details', with: "Chest"
        fill_in 'Activity date', with: "2015-08-07"
        
        click_button 'Create Exercise'
        
        expect(page).to have_content("Exercise has been created")
        
        exercise = Exercise.last
        
        expect(page.current_path).to eq(user_exercise_path(@john, exercise))
        
        
        
     end
     
     scenario 'with valid inputs' do
         visit '/'
        
        click_link 'My Lounge'
        click_link 'New Workout'
        
        expect(page).to have_link('Back')
     
        fill_in 'Duration', with: ""
        fill_in 'Workout Details', with: ""
        fill_in 'Activity date', with: ""
        
        click_button 'Create Exercise'
        
        expect(page).to have_content("Duration in min can't be blank")
        expect(page).to have_content("Workout can't be blank")
        expect(page).to have_content("Workout date can't be blank")


        
        end
     
     

end