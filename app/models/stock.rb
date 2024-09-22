class Stock < ApplicationRecord

  belongs_to :user
  validates :name, presence: true, uniqueness: { scope: :user_id }
  validates :amount, :price, presence: true
  validates :barcode, presence: true, uniqueness: true
  has_many :sales


end
