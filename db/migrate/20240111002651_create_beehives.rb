class CreateBeehives < ActiveRecord::Migration[7.1]
  def change
    create_table :beehives do |t|

      t.timestamps
    end
  end
end
