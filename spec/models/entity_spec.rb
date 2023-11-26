require 'rails_helper'

RSpec.describe Entity, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:group) }
  it { should validate_presence_of(:name) }
  it { should validate_numericality_of(:amount).is_greater_than(0) }
  it { should belong_to(:group) }

  it 'validates presence of name' do
    entity = Entity.new(name: nil)
    expect(entity.valid?).to be_falsey
    expect(entity.errors[:name]).to include("can't be blank")
  end

  it 'validates numericality of amount' do
    entity = Entity.new(amount: 'not_a_number')
    expect(entity.valid?).to be_falsey
    expect(entity.errors[:amount]).to include('is not a number')
  end

  let(:user) { User.create(name: 'Test User', email: 'example1@email.com', password: 'password') }
  let(:group) { Group.create(name: 'Food', icon: '&#x1F374;', user:) }

  it 'is associated with an author (User)' do
    entity = Entity.new(amount: 30.00, group:, user:)
    expect(entity.user).to eq(user)
  end

  it 'requires a group' do
    entity = Entity.new(amount: 25, user:)
    expect(entity).to_not be_valid
  end

  it 'requires an author (User)' do
    entity = Entity.new(amount: 30.00, group:)
    expect(entity).to_not be_valid
  end

  it 'can save a valid entity' do
    entity = Entity.new(name: 'Pizza', amount: 25, group:, user:)
    expect(entity).to be_valid
  end
end
