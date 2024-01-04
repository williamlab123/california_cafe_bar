class Sale < ApplicationRecord
    belongs_to :client
    belongs_to :stock


    def sale_params
       params.require(:sale).permit(:client_id, user_id, :stock_id, :quantity)
    end
  end