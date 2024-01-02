class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|

      t.timestamps
      t.string :username
      t.string :password_digest
    end

    create_table :stock do |t|
      t.string :name
      t.references :user, null: false, foreign_key: true
      t.integer :amount
      t.float :price 
      t.timestamps
    end
    
  end
end
