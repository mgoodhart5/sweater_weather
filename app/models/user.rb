class User < ApplicationRecord
  validates_presence_of :email, :password
  has_many :favorites
  has_secure_password
end
