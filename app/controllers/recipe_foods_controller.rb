class RecipeFoodsController < ApplicationController
  #  before_action :set_recipe_food, only: %i[show edit update destroy]
  skip_before_action :verify_authenticity_token
  # GET /recipe_foods or /recipe_foods.json
  def index
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_foods = RecipeFood.where(recipe_id: @recipe.id)
  end

  # GET /recipe_foods/1 or /recipe_foods/1.json
  def show
    @recipe = Recipe.find(params[:id])
    @recipe_food = RecipeFood.find(params[:id])
  end

  # GET /recipe_foods/new
  def new
    @recipe_food = RecipeFood.new
    @recipe = Recipe.find(params[:recipe_id])
  end

  # GET /recipe_foods/1/edit
  def edit
    @recipe = Recipe.find(params[:id])
    @recipe_food = RecipeFood.find(params[:id])
  end

  # POST /recipe_foods or /recipe_foods.json
  def create
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = @recipe.recipe_foods.new(recipe_food_params)

    respond_to do |format|
      if @recipe_food.save
        format.html { redirect_to recipe_url(@recipe.id), notice: 'Recipe food was successfully created.' }
        format.json { render :show, status: :created, location: @recipe }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @recipe_food.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipe_foods/1 or /recipe_foods/1.json
  def destroy
    @recipe_food = RecipeFood.find(params[:id])
    @recipe_food.destroy

    respond_to do |format|
      format.html { redirect_to recipes_path, notice: 'Recipe food was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.

  # Only allow a list of trusted parameters through.
  def recipe_food_params
    params.require(:recipe_food).permit(:food_id, :quantity)
  end
end
