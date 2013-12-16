require 'bcrypt'

class User < ActiveRecord::Base

  # stores password, but then forgets it
  attr_accessor :password, :password_confirmation

  has_many :friendships
  has_many :friends, through: :friendships
  has_many :inverse_friendships, class_name: "Friendship", foreign_key: "friend_id"
  has_many :inverse_friends, through: :inverse_friendships, source: :user

  has_many :sent_requests, class_name: "MeetRequest", foreign_key: "sender_id"
  has_many :received_requests, class_name: "MeetRequest", foreign_key: "receiver_id"
  has_many :recipients, through: :sent_requests, source: :receiver

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
