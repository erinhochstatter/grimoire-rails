class Friend < ApplicationRecord
  has_many :posts
  validates :first_name, presence: true
  validates :last_name, presence: true
end
