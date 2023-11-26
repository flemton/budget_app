require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:entities) }
  it { should have_many(:groups) }

  it 'is valid with a valid email and password' do
    user = User.new(email: 'test@example.com', password: 'password123', password_confirmation: 'password123')
    expect(user).to be_valid
  end

  it 'is invalid without an email' do
    user = User.new(email: nil)
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end

  it 'is invalid with a duplicate email' do
    User.create(email: 'test@example.com', password: 'password123', password_confirmation: 'password123')
    user = User.new(email: 'test@example.com')
    user.valid?
    expect(user.errors[:email]).to include('has already been taken')
  end

  it 'is invalid without a password' do
    user = User.new(password: nil)
    user.valid?
    expect(user.errors[:password]).to include("can't be blank")
  end
end
