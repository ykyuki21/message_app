class User < ApplicationRecord
  has_many :messages

  validates :name, presence: true, uniqueness: true
  has_secure_password
end
