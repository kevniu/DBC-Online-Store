require 'bcrypt'

class User < ActiveRecord::Base

  has_many :carts

  include BCrypt

  validates_presence_of :email, :name, :password
  validates_uniqueness_of :email

  has_secure_password

  enum role: [:customer, :admin]

end
