class Stock < ApplicationRecord

  belongs_to :user
  validates :name, presence: true, uniqueness: { scope: :user_id }
  validates :amount, :price, presence: true
  has_many :clients, through: :sales
  has_many :sales


end
