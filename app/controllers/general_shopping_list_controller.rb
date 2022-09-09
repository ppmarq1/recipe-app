class GeneralShoppingListController < ApplicationController
  def index
    user_foods = current_user.foods
    all_foods = current_user.recipes.includes(recipe_foods: [:food]).map do |recipe|
      recipe.recipe_foods.map(&:food)
    end
    recipes_foods = all_foods.flatten
    @food_items_to_buy = user_foods.select { |food| food unless recipes_foods.include?(food) }
    @total_foods = @food_items_to_buy.count
    @total_price = @food_items_to_buy.map(&:price).sum
  end

  private

  def recipe_params
    params.require(:recipe).permit(:recipe)
  end
end
