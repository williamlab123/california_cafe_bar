class AddBarcodeToStocks < ActiveRecord::Migration[7.1]
  def change
    add_column :stocks, :barcode, :string
  end
end