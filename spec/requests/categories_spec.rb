 require 'rails_helper'


RSpec.describe "Category HTTP Request & Responses", type: :request do  

  before do
    sign_in create(:user)    
  end

  before do
    @category = User.last.categories.create(title: "Test Category")
  end
  
  # after :all do
  #   User.destroy_all
  # end

  describe "GET /index" do  
    it "1. Returns a successful response on home page" do      
      get root_path      
      expect(response).to have_http_status(200)
      end
    end
    
  describe "GET /show" do
    it "2. Returns a successful response on show page" do         
      get category_path(@category)
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /new" do
    it "3. Returns a successful response on new page" do
      get new_category_path
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /edit" do
    it "4. Returns a successful response on edit page" do
      get edit_category_path(@category)
      expect(response).to have_http_status(200)
    end
  end  
end
