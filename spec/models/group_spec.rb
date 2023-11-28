require 'rails_helper'

RSpec.describe Group, type: :model do
  it { should belong_to(:user) }
  it { should have_many(:entities) }

  it { should validate_presence_of(:name) }

  let(:user) { User.create(name: 'Test User', email: 'example1@email.com', password: 'password') }

  it 'is valid with a name and user' do
    group = Group.new(name: 'Food', icon: '&#x1F374;', user:)
    expect(group).to be_valid
  end

  it 'is not valid without a user' do
    group = Group.new(name: 'Transportation')
    expect(group).not_to be_valid
  end

  it 'allows the same category name for different users' do
    another_user = User.create(name: 'Newt', email: 'newt@science.com', password: 'strongpass')
    Group.create(name: 'Food', icon: '&#x1F374;', user:)
    group2 = Group.new(name: 'Food', icon: '&#x1F374;', user: another_user)
    expect(group2).to be_valid
  end
end
