require 'rails_helper'

RSpec.describe 'Food page test', type: :feature do
  describe 'index page' do
    before :each do
      @user = User.create(name: 'Dudu', email: 'dudu@test.com', password: '123456789')
      @food = @user.foods.create(name: 'Chicken', measurement_unit: 'kg', price: 2, quantity: 3)

      visit new_user_session_path
      fill_in 'Email', with: 'dudu@test.com'
      fill_in 'Password', with: '123456789'
      click_on 'Log in'
    end

    it 'check foods#index path' do
      visit '/'
      expect(current_path).to eq(root_path)
      expect(page).to have_text('List of foods')
    end

    it 'Should display all user food details' do
      visit foods_path
      expect(page).to have_content('Chicken')
      expect(page).to have_content('kg')
      expect(page).to have_content('2.0')
    end

    it "Should navigate to food's new page" do
      visit foods_path
      click_link 'Add food'
      expect(current_path).to eq(new_food_path)
    end
  end
end
