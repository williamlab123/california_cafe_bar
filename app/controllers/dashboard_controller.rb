class DashboardController < ApplicationController
  helper_method :sales

  def sales
    day_sales
    day_balance

    sales_by_month = Sale.all.group_by { |sale| sale.created_at.beginning_of_month }
    @sales_totals_by_month = sales_by_month.map do |month, sales|
      total_price = sales.sum { |sale| sale.total_price || 0 }
      total_quantity = sales.sum { |sale| sale.quantity || 0 }
      [month, [total_price, total_quantity]]
    end.to_h
  end

  def day_sales
    @today_sales = Sale.where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day)
                       .includes(:stock) # Preload the Stock association
  end
  
  def day_balance
    @today_balance = Sale.where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day)
                          .sum(:total_price)
  end

  def day_stock
    @today_sales = Sale.where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day)
    @stock_items_sold = @today_sales.group(:stock_id).sum(:quantity)
  end

  def stock
    day_stock
  end

  def compare_months; end

  def index
   end

  def show; end

  def export
    day_sales
    day_stock

    respond_to do |format|
      format.xlsx {
        response.headers['Content-Disposition'] = 'attachment; filename="sales_and_stock_data.xlsx"'
      }
    end
  end
end
