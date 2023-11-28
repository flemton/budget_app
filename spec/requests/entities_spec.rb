require 'rails_helper'

RSpec.describe 'Entities', type: :request do
  let(:user) { User.create!(name: 'User Name', email: 'user@example.com', password: 'password') }
  let(:group) { Group.create!(name: 'Test Group', icon: 'icon', user:) }

  before do
    sign_in user
  end

  describe 'POST /create' do
    let(:valid_attributes) { { name: 'New Entity', amount: 100, group_id: group.id } }

    it 'creates a new entity' do
      expect do
        post group_entities_path(group), params: { entity: valid_attributes }
      end.to change(Entity, :count).by(1)
      expect(response).to redirect_to(group_entities_path(group))
    end
  end
end
