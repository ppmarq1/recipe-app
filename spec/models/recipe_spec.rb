require 'rails_helper'

RSpec.describe Recipe, type: :model do
  user = User.create(name: 'Dudu')
  subject do
    Recipe.new(user_id: user.id, name: 'Chicken Salad', preparation_time: '2 hours', cooking_time: '1 hour',
               description: 'Chicken Salad description')
  end
  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'preparation time should be present' do
    subject.preparation_time = nil
    expect(subject).to_not be_valid
  end

  it 'cooking time should be present' do
    subject.cooking_time = nil
    expect(subject).to_not be_valid
  end

  it 'description should be present' do
    subject.description = nil
    expect(subject).to_not be_valid
  end

  it 'description should be present' do
    expect(subject.public).to be_falsey
  end
end
