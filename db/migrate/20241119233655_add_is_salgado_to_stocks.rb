class AddIsSalgadoToStocks < ActiveRecord::Migration[7.1]
  def change
    add_column :stocks, :is_salgado, :boolean
  end
end
