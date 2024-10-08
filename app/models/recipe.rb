class Recipe < ApplicationRecord
  belongs_to :sale

  def create_recipe
    @recipe = Recipe.new(recipe_params)
    @recipe.save
  end

  def recipe_note
    @recipe_note = "Receipt\n\n" +
                   "Date: #{sale.created_at.strftime('%d/%m/%Y %H:%M')}\n\n" +
                   "Sale Details:\n" +
                   "Product: #{sale.stock.name}\n" +
                   "Quantity: #{sale.quantity}\n" +
                   "Total Price: #{sale.total_price}R$\n\n" +
                   "Thank you for your purchase!"
                   
  end

  def recipe_params
    params.require(:recipe, :sale).permit(:stock_id, :quantity, :total_price, :user_id)
  end
end
