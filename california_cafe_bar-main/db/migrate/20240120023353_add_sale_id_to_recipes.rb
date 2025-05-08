class AddSaleIdToRecipes < ActiveRecord::Migration[7.1]
  def change
    add_reference :recipes, :sale, null: false, foreign_key: true
  end
end
