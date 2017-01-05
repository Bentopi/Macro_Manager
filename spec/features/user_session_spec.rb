describe "Sign In/Out Process", :type => :feature do
  before :each do
    User.create(email: 'test@testuser.com', username: 'testuser', password: 'password')
  end

  it "User can sign in" do
    user_sign_in
    expect(page).to have_content 'My Nutrition'
  end

  it "User can sign out" do
    user_sign_in
    click_link "Your Account"
    click_link "Sign Out"
    expect(page).to have_content 'Sign In'
  end

  def user_sign_in
    visit '/sign_in'
    fill_in 'Email', with: 'test@testuser.com'
    fill_in 'Password', with: 'password'
    click_button 'Sign In'
  end
end
