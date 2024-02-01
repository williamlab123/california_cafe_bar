class CreateSales < ActiveRecord::Migration[7.1]
  def change
    create_table :sales do |t|
      t.integer :client_id
      t.integer :stock_id
      t.integer :quantity
      t.decimal :total_price
      t.integer :user_id

      t.timestamps
    end
  end
end
