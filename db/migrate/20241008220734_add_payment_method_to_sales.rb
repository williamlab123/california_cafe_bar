class AddPaymentMethodToSales < ActiveRecord::Migration[7.1]
  def change
    add_column :sales, :payment_method, :string
  end
end
