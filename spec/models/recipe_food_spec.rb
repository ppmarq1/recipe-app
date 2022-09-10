require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  recipe = Recipe.create(name: 'Chicken Salad', preparation_time: '2 hours', cooking_time: '1 hour',
                         description: 'Chicken Salad description')
  subject { RecipeFood.new(recipe_id: recipe.id, food_id: 1, quantity: 1) }
  before { subject.save }

  it 'recipe_id should be present' do
    subject.recipe_id = nil
    expect(subject).to_not be_valid
  end

  it 'food_id should be present' do
    subject.food_id = nil
    expect(subject).to_not be_valid
  end

  it 'quantity should be present' do
    subject.quantity = nil
    expect(subject).to_not be_valid
  end

  it 'quantity should be greater than or equal to 0' do
    subject.quantity = -1
    expect(subject).to_not be_valid
  end
end
