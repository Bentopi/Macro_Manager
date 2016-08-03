class User < ActiveRecord::Base
  has_secure_password
  validates :email, presence: true
  validates :username, presence: true

  has_many :mealplans
  has_many :meals, through: :mealplans

  def height_formatted
    inches = self.height.to_i % 12
    feet = self.height.to_i / 12
    "#{feet} ft. #{inches} in."
  end
end
