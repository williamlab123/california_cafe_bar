class Recipe < ApplicationRecord
  belongs_to :sale

  def create_recipe
    @recipe = Recipe.new(recipe_params)
    @recipe.save
  end

  def recipe_note
    @recipe_note = "Nota de venda\n\n" +
                   "Data: #{sale.created_at.strftime('%d/%m/%Y %H:%M')}\n\n" +
                   "Detalhes da venda:\n" +
                   "Produto: #{sale.stock.name}\n" +
                   "Quantidade: #{sale.quantity}\n" +
                   "Preço final: #{sale.total_price}R$\n\n" +
                   "Vendedor: #{sale.user.name}\n\n" + 
  end

  def recipe_params
    params.require(:recipe, :sale).permit(:stock_id, :quantity, :total_price, :user_id)
  end
end
