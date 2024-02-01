class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true

  has_many :stock
  has_many :clients

  has_secure_password
end
