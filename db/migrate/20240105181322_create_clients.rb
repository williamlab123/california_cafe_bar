class CreateClients < ActiveRecord::Migration[7.1]
  def change
    create_table :clients do |t|
      t.string :name
      t.integer :user_id
      t.string :required
      t.float :balance

      t.timestamps
    end
  end
end
