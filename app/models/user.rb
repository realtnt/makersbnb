class User < ActiveRecord::Base
  has_many :spaces
  has_many :messages
  has_many :requests
  has_many :bookings

  validates :email, uniqueness: true
  validates :email, presence: true
  has_secure_password
end
