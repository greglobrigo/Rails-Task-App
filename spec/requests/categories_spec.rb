 require 'rails_helper'


RSpec.describe "Category HTTP Request & Responses", type: :request do  

  describe "GET /index" do
    it "1. Returns a successful response on home page" do      
      get categories_url
      expect(response).to be_successful
      expect(response).to have_http_status(200)
      end
    end

  describe "GET /show" do
    it "2. Returns a successful response on show page" do
        category = Category.create!(title: "Test Category")
        get category_url(category)
        expect(response).to be_successful
        expect(response).to have_http_status(200)
      end
     end

  describe "GET /new" do
    it "3. Returns a successful response on new page" do
        get new_category_url
        expect(response).to be_successful
        expect(response).to have_http_status(200)
        end
     end

  describe "GET /edit" do
    it "4. Returns a successful response on edit page" do
        category = Category.create!(title: "Test Category")
        get edit_category_url(category)
        expect(response).to be_successful
        expect(response).to have_http_status(200)
        end
     end
   
   describe "POST /create" do
    it "5. Returns a successful redirect response on create new category" do
        post '/categories', params: { category: { title: "Test Category" } }
        expect(response).to redirect_to(Category.last)
        expect(response).to have_http_status(302)
         end
    end

    describe "PUT /update" do
    it "6. Returns a successful redirect response on update category" do
        category = Category.create!(title: "Test Category")
        put category_url(category), params: { category: { title: "Test Category -- edited" } }
        expect(response).to redirect_to(category)
        expect(response).to have_http_status(302)
        end
    end

    describe "DELETE /destroy" do
    it "7. Returns a successful redirect response on delete category" do
        category = Category.create!(title: "Test Category")
        delete category_url(category)
        expect(response).to redirect_to(categories_url)
        expect(response).to have_http_status(302)
        end
     end
end
