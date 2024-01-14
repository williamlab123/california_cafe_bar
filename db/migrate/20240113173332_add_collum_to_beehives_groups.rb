class AddCollumToBeehivesGroups < ActiveRecord::Migration[7.1]
  def change
    add_column :beehive_groups, :honey_retrievement, :decimal, precision: 12, scale: 4
  end
end
