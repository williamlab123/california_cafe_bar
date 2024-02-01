class Client < ApplicationRecord
  belongs_to :user
  has_many :sales

  def balance
    total = sales.joins(:stock).sum('quantity * price')
    total > 0 ? total : "You have no balance"
  end
end