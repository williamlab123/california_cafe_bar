class Stock < ApplicationRecord
  self.table_name = 'stock'

  belongs_to :user
  validates :name, presence: true, uniqueness: true

end
