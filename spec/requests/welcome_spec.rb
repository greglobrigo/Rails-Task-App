require 'rails_helper'

RSpec.describe "Welcomes", type: :request do
  describe "GET /index" do
    it "1. Returns http success on welcome page" do
      get "/"
      expect(response).to have_http_status(:success)
    end
  end
end
