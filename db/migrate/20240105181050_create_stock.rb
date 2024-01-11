class CreateStock < ActiveRecord::Migration[7.1]
  def change
    create_table :stocks do |t|
      t.string :name
      t.integer :user_id
      t.integer :amount
      t.float :price

      t.timestamps
    end
  end
end
