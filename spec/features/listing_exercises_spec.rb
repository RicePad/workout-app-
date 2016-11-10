require 'rails_helper'

RSpec.feature "Display Listing" do 
    
    before do 
         @john = User.create(email: "two@example.com", password: "password")
         @sara = User.create(email: "sara@example.com", password: "password")

         login_as(@john)
         
         @exercise1 = @john.exercises.create(duration_in_min: 2, workout: "Chest Press", workout_date: Date.today )
         @exercise2 = @john.exercises.create(duration_in_min: 2, workout: "Leg Press", workout_date: Date.today )


     end

    scenario " show workouts the past 7 days" do 
	    visit "/"
		
		
        click_link 'My Lounge'
	
	expect(page).to have_content(@exercise1.duration_in_min)
    expect(page).to have_content(@exercise1.workout)
    expect(page).to have_content(@exercise1.workout_date)
    expect(page).to have_content(@exercise2.duration_in_min)
    expect(page).to have_content(@exercise2.workout)
    expect(page).to have_content(@exercise2.workout_date)
		
	end
end

