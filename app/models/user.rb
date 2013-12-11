require 'bcrypt'

class User < ActiveRecord::Base
  # attr_accessor :latitude, :longitude, :address, :name

  # geocoded_by :address
  # reverse_geocoded_by :latitude, :longitude
  # after_validation :reverse_geocode

  has_many :friendships
  has_many :friends, :through => :friendships
  has_many :inverse_friendships, class_name: "Friendship", foreign_key: "friend_id"
  has_many :inverse_friends, through: :inverse_friendships, source: :user

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
