class Client < ApplicationRecord
  belongs_to :user
  has_many :sales
  has_many :stocks, through: :sales

  def balance
    sales.joins(:stock).sum('quantity * price')
  end

  
end
