require 'rails_helper'

RSpec.describe 'Users', type: :request do

    before do
        sign_in create(:user)
      end

    describe 'GET /users/edit' do
        it 'returns http success' do
            get '/users/edit'
            expect(response).to have_http_status(200)
        end
    end

end