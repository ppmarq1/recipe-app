class RecipesController < ApplicationController
  def index
    @user = User.find(current_user.id)
    @recipes = Recipe.where(user_id: @user.id)
  end

  def new; end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def create
    @user = User.find(current_user.id)
    @recipe = @user.recipes.new(recipe_params)

    if @recipe.save
      redirect_to recipes_path, notice: 'New recipe created successfully.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy

    respond_to do |format|
      format.html { redirect_to recipes_url, notice: 'Recipe was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public, :user_id)
  end
end
