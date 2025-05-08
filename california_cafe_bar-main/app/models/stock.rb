class Stock < ApplicationRecord
  before_save :set_default_barcode, if: :is_salgado?

  belongs_to :user

  validates :name, presence: true, uniqueness: { scope: :user_id }
  validates :amount, :price, presence: true

  # Conditional validation for barcode only if it's not a "salgado"
  validates :barcode, presence: true, uniqueness: true, length: { is: 13 }, unless: :is_salgado?

  has_many :sales

  def set_default_barcode
    self.barcode = "1111111111111" # default barcode to all salgados
  end

  def is_salgado?
    self[:is_salgado] == true
  end
end


