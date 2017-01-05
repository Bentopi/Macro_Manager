describe "Guest Nutrition", :type => :feature do

  it "Guest can get nutrition goals" do
    visit '/guestmacros'
    choose('gender_M')
    fill_in 'age', with: '30'
    fill_in 'weight', with: '180'
    select('5\'9', :from => 'height')
    select('Lose Weight', :from => 'weight_rate')
    select('5', :from => 'workout_count')
    select('Tough Workouts Ahead.', :from => 'workout_intensity')
    choose('workout_type_L')
    click_button 'Calculate Macros!'
    expect(page).to have_content '2130 Calories'
  end
end
