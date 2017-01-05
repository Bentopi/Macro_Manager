describe "User Nutrition", :type => :feature do

  it "New user can get nutrition goals" do
    complete_registration_form
    select_user_stats
    select_user_goals
    obtain_macros
  end

  def complete_registration_form
    visit '/registration'
    fill_in 'Email', with: 'catman@testuser.com'
    fill_in 'Username', with: 'thecatman'
    fill_in 'Password', with: 'password'
    fill_in 'user_password_confirmation', with: 'password'
    click_button 'Create User'
  end

  def select_user_stats
    choose('user_gender_m')
    fill_in 'user_age', with: '30'
    fill_in 'user_weight', with: '180'
    select('5\'9', :from => 'user_height')
    click_button 'Update User'
  end

  def select_user_goals
    select('Lose Weight', :from => 'user_weight_rate')
    select('5', :from => 'user_workout_count')
    select('Tough Workouts Ahead.', :from => 'user_workout_intensity')
    choose('user_workout_type_l')
    click_button 'Calculate Macros!'
  end

  def obtain_macros
    expect(page).to have_content '2130 Calories'
  end

  it "Existing user can update nutrition goals" do

  end
end
