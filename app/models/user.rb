class User < ActiveRecord::Base
  has_many :songs
  has_many :votes

  validates :first_name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }
  validates :password, presence: true, length: { minimum: 5 }
end
