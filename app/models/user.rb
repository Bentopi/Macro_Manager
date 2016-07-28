class User < ApplicationRecord
  has_secure_password
  # validates :email, presence: true
  has_many :macroprofiles
  has_many :mealplans, through: :macroprofiles
end
