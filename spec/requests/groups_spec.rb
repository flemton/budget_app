require 'rails_helper'

RSpec.describe 'Groups', type: :request do
  let(:user) do
    User.create(name: 'User Name', email: 'user@gmail.com', password: 'password')
  end
  let(:group) { Group.create!(name: 'Test Group', icon: 'icon', user:) }

  before do
    sign_in user
  end

  describe 'GET /index' do
    it 'returns http success' do
      get groups_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get group_path(group)
      expect(response).to have_http_status(:success)
    end
  end
end
