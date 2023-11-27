require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'POST /users' do
    let(:user_params) do
      {
        user: {
          email: 'user@example.com',
          password: 'password',
          name: 'Test User' # Add or remove attributes based on your User model
        }
      }
    end

    context 'with valid parameters' do
      it 'creates a new user and redirects' do
        expect do
          post user_registration_path, params: user_params
        end.to change(User, :count).by(1)

        expect(response).to have_http_status(:see_other)
      end
    end

    context 'with invalid parameters' do
      it 'does not create a user and renders the page again' do
        user_params[:user][:email] = 'invalid_email' # Making email invalid

        expect do
          post user_registration_path, params: user_params
        end.to_not change(User, :count)

        expect(response).to have_http_status(:unprocessable_entity) # Or :success if it renders the same page
      end
    end
  end
end
