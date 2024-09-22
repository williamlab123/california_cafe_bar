class Sale < ApplicationRecord

  belongs_to :stock
  
  has_one :recipe
  before_create :calculate_total_price
  
  validate :update_stock_quantity
  after_create :create_recipe, :test

  validates :stock, presence: true

  private

  def calculate_total_price
    self.total_price = quantity * stock.price
  end

  def test
    puts "SDISUEGIUSYERTHUNTUN8EUYRGYHUNRU T"
  end

  
  def update_stock_quantity
    if stock.amount < quantity
      errors.add(:quantity, "can't be greater than stock amount")
      throw :abort
    else
      stock.amount -= quantity
      stock.save
    end
  end
  

  def create_recipe
    Recipe.create(
      sale: self,
      stock_id:,
      quantity:,
      total_price:
    )
  end
end
