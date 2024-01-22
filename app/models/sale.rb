class Sale < ApplicationRecord
  belongs_to :client
  belongs_to :stock
  belongs_to :user
  has_one :recipe

  before_create :calculate_total_price
  validate :update_stock_quantity
  after_create :create_recipe

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

  def create_recipe
    Recipe.create(
      sale: self,
      client_id: self.client_id,
      stock_id: self.stock_id,
      quantity: self.quantity,
      total_price: self.total_price,
      user_id: self.user_id
    )
  end
end
