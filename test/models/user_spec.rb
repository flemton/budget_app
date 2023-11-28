require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:entities) }
  it { should have_many(:groups) }
end
