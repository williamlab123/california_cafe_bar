class Sale < ApplicationRecord
  belongs_to :client
  belongs_to :stock
  belongs_to :user

  before_create :calculate_total_price
  validate :update_stock_quantity 
  

  validates :user, :client, :stock, presence: true

  private

  def calculate_total_price
    self.total_price = quantity * stock.price
  end

  def update_stock_quantity
    stock.amount -= quantity
    if stock.amount < 0
      errors.add(:quantity, "can't be greater than stock amount")
      throw :abort
    else
      stock.save
    end
  end
end