describe "Registration", :type => :feature do

  it "User can register and get macros" do
    visit '/registration'
    fill_in 'Email', with: 'catman@testuser.com'
    fill_in 'Username', with: 'thecatman'
    fill_in 'Password', with: 'password'
    fill_in 'user_password_confirmation', with: 'password'
    click_button 'Create User'
    expect(page).to have_content 'My Nutrition'
  end


end
