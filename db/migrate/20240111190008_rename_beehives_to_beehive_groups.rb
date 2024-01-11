class RenameBeehivesToBeehiveGroups < ActiveRecord::Migration[7.1]
  def change
    rename_table :beehives, :beehive_groups

  end
end
