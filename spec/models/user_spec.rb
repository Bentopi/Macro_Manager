require 'rails_helper'

describe User do

  it 'is invalid without a username or email' do
    user = User.new
    expect { user.save! }.to raise_error(
      ActiveRecord::RecordInvalid
    )
  end

  it 'is invalid without a username' do
    user = User.new(email: "testuser@testemail.com", password: "1234")
    expect { user.save! }.to raise_error(
      ActiveRecord::RecordInvalid
    )
  end

  it 'is invalid without an email' do
    user = User.new(username: "Testuser", password: "1234")
    expect { user.save! }.to raise_error(
      ActiveRecord::RecordInvalid
    )
  end

  it 'is valid with when provided email, username and password' do
    user = User.new(username: "Testuser", email: "testuser@testemail.com", password: "1234")
    expect { user.save! }.to_not raise_error
  end
end

#
#
#   def height_formatted
#     inches = self.height.to_i % 12
#     feet = self.height.to_i / 12
#     "#{feet} ft. #{inches} in."
#   end
#
#   def full_gender
#     if gender == "F"
#       return "Female"
#     else
#       return "Male"
#     end
#   end
# end
