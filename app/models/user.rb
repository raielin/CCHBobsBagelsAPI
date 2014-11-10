class User < ActiveRecord::Base
  validates :email, presence: true
  # validates :password_digest, presence: true
  # validates :access_token, presence: true
  # validates :token_scope, presence: true
  # validates :token_expired_at, presence: true
  # validates :token_created_at, presence: true
  # validates :access_token, uniqueness: true
  # validates :email, uniqueness: true
end
