# app/controllers/barcodes_controller.rb
class BarcodesController < ApplicationController


  #   When the user clics in the button 'leitor', in the home index, i want it to start selling.
  # So, as the user adds products in the reader, it will appear below the reader.
  # And the sale will be finished when the user clicks in the button 'finalizar venda'.
  # Then, when the user finish the sale, the items below the reader will be saved in the database and vanish from the reader.
  # This way, the user can start a new sale.
  def start_selling
    session[:stocks] = []
    redirect_to barcodes_scan_path
  end

  def search
    barcode = params[:barcode]
    stock = Stock.find_by(barcode: barcode)
    
    session[:stocks] ||= []
  
    session[:stocks] << stock if stock
    
    redirect_to barcodes_scan_path
  end


  def finish_sale
    puts "CONTROLLER FINISHING SALE"
    
    session[:stocks].each do |stock_data|
      stock_info = stock_data.is_a?(Array) ? stock_data.last : stock_data
      stock = Stock.find(stock_info['id'])
  
      puts "Current stock amount: #{stock.amount}, trying to create sale with quantity: 1"
  
      sale = Sale.create(stock: stock, quantity: 1)
  
      if sale.save
        puts "Sale successfully created!"
      else
        puts "Sale failed to save: #{sale.errors.full_messages}"
      end
    end
  
    session[:stocks] = []
    redirect_to barcodes_scan_path, notice: 'Sale was successfully created.'
  end

  def cancel_sale
    session[:stocks] = []
    redirect_to barcodes_scan_path, notice: 'Sale was successfully canceled.'
  end
end
