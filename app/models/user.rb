require 'bcrypt'

class User < ActiveRecord::Base

	before_save :hash_password

  def authenticate(password)
    self.hashed_password ==
    BCrypt::Engine.hash_secret(password, self.salt)
  end

  private

  def hash_password
    if password.present?
      self.salt = BCrypt::Engine.generate_salt
      self.hashed_password = BCrypt::Engine.hash_secret(password, self.salt)
      password = password_confirmation = nil
    end
  end
end
