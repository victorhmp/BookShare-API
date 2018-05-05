class User < ApplicationRecord
  has_secure_password
  validates_uniqueness_of :username
  has_secure_token :auth_token

  has_many :wishlists

  def invalidate_token
    self.update_columns(auth_token: nil)
  end

  def self.validate_login(username, password)
    user = find_by(username: username)
    if user && user.authenticate(password)
      user
    end
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :trackable, :validatable,
  #        :jwt_authenticatable, jwt_revocation_strategy: JwtBlacklist
end
