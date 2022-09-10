require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Dudu') }
  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'checking if the user is admin' do
    expect(subject.admin?).to be_falsey
  end
end
