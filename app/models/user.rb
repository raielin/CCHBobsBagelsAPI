class User < ActiveRecord::Base
<<<<<<< HEAD
  # validates :email, presence: true
  # validates :password_digest
  # validates :access_token
  # validates :token_scope
  # validates :token_expired_at
  # validates :token_created_at
# Need to add validations for uniqueness
=======
  has_many :orders
  validates :email, presence: true
  # validates :password_digest, presence: true
  # validates :access_token, presence: true
  # validates :token_scope, presence: true
  # validates :token_expired_at, presence: true
  # validates :token_created_at, presence: true
  # validates :access_token, uniqueness: true
  # validates :email, uniqueness: true
>>>>>>> ad94a61485c9bf0b70de953fc6dc9263b04c7af8
end
