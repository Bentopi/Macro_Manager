require 'rails_helper'

describe User, type: :model do
  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:email) }
  it { should have_secure_password}
  it { should have_many(:mealplans)}
  it { should have_many(:meals).through(:mealplans)}

  it "returns the user's height as a formatted string" do
    user = User.create(:username => 'testuser',
      :email => '1234@test.com', :height => '150')
    expect(user.height_formatted).to eq("12 ft. 6 in.")
  end

  it "returns the user's gender as a formatted string" do
    user = User.create(:username => 'testuser',
      :email => '1234@test.com', :gender => 'M')
    expect(user.full_gender).to eq("Male")

  end
end
