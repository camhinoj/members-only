class User < ApplicationRecord
  attr_accessor :remember_token
  before_create :remember_user
  has_secure_password
  has_many :posts


  def remember_user
    token = SecureRandom.urlsafe_base64
    self[:remember_token] = Digest::SHA1.hexdigest(token).to_s
    token
  end
end
