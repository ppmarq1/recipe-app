require 'rails_helper'

RSpec.describe 'RecipeFoods', type: :request do
  before :each do
    @user = User.create(name: 'Dudu', email: 'dudu@test.com', password: '123456789')
    @food = @user.foods.create(name: 'Chicken', measurement_unit: 'kg', price: 2, quantity: 3)
    post user_session_path, params: { user: { email: @user.email, password: @user.password } }
  end

  describe 'GET #index' do
    before(:example) { get foods_path }

    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'show' template" do
      expect(response).to render_template('index')
    end

    it 'should include "List of foods"' do
      expect(response.body).to include('List of foods')
    end
  end
end
