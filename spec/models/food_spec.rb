require 'rails_helper'

RSpec.describe Food, type: :model do
  subject { Food.new(name: 'Chicken', measurement_unit: 'kg', price: 2, quantity: 3) }
  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'measurement_unit should be present' do
    subject.measurement_unit = nil
    expect(subject).to_not be_valid
  end

  it 'price should be present' do
    subject.price = nil
    expect(subject).to_not be_valid
  end

  it 'price should be greater than or equal to 0' do
    subject.price = -1
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
