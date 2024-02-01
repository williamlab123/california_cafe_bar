class AddDetailsToBeehives < ActiveRecord::Migration[7.1]
  def change
    add_column :beehives, :name, :string
    add_column :beehives, :user_id, :integer
    add_column :beehives, :beehive_amount, :integer
    add_column :beehives, :honey_amount, :float
  end
end
