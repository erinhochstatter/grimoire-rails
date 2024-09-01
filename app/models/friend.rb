class Friend < ApplicationRecord
  has_secure_token :session_token, length: 36
  has_many :posts
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :session_token, presence: true, uniqueness: { case_sensitive: false }
end
