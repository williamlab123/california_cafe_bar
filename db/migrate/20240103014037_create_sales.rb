class CreateSales < ActiveRecord::Migration[7.1]
  def change
    create_table :sales do |t|
      t.references :client, null: false, foreign_key: true
      t.references :stock, null: false, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
