require 'rails_helper'

RSpec.describe 'Splash Screen', type: :request do
  describe 'GET /' do
    context 'when not logged in' do
      it 'renders the splash screen with login and sign up links' do
        get root_path

        expect(response).to have_http_status(:success)
        expect(response.body).to include('SIGN UP')
        expect(response.body).to include('LOG IN')
        expect(response.body).to include(new_user_registration_path)
        expect(response.body).to include(new_user_session_path)
      end
    end
  end

  describe 'GET /' do
    context 'when logged in' do
      let(:user) { User.create!(name: 'User Name', email: 'user@gmail.com', password: 'password') }

      before do
        # Simulate a logged-in user
        sign_in user
      end

      it 'redirects to the dashboard or another appropriate page' do
        get root_path

        expect(response).to have_http_status(:success)
        expect(response.body).to include('CATEGORIES')
      end
    end
  end
end
