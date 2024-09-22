class DashboardController < ApplicationController
  helper_method :sales

  def sales
    sales_by_month = Sale.all.group_by { |sale| sale.created_at.beginning_of_month }
    @sales_totals_by_month = sales_by_month.map do |month, sales|
      total_price = sales.sum { |sale| sale.total_price || 0 }
      total_quantity = sales.sum { |sale| sale.quantity || 0 }
      [month, [total_price, total_quantity]]
    end.to_h
  end

  def compare_months; end

  def index; end

  def show; end
end
