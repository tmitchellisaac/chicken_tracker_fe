class User < ApplicationRecord
  validates :email, uniqueness: true, presence: true
  validates_presence_of :password_digest

  has_secure_password
end