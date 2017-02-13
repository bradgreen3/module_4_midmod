class User < ApplicationRecord

  has_secure_password

  validates_confirmation_of :password
  validates_uniqueness_of :email, :presence => true, :case_sensitive => false

end
