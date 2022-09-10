require 'rails_helper'

RSpec.describe 'Recipe food page test', type: :feature do
  describe 'new page' do
    before :each do
      @user = User.create(name: 'Dudu', email: 'dudu@test.com', password: '123456789')
      @recipe = @user.recipes.create(name: 'Chicken Salad', preparation_time: '2 hours', cooking_time: '1 hour',
                                     description: 'Chicken Salad description')

      visit new_user_session_path
      fill_in 'Email', with: 'dudu@test.com'
      fill_in 'Password', with: '123456789'
      click_on 'Log in'
    end

    it 'check recipe_foods#new path' do
      visit "/recipes/#{@recipe.id}/recipe_foods/new"
      expect(current_path).to eq("/recipes/#{@recipe.id}/recipe_foods/new")
      expect(page).to have_text('Add ingredient')
    end
  end
end
