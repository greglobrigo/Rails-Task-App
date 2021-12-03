require 'rails_helper'

RSpec.describe "Welcomes", type: :request do
  describe "GET /index" do

    before do
      sign_in create(:user)
    end
 
    it "1. Returns http success on welcome page" do
      get "/"
      expect(response).to have_http_status(200)
    end
  end
end
