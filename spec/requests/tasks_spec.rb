 require 'rails_helper'

RSpec.describe "Tasks HTTP Request & Responses", type: :request do    
    before do
        sign_in create(:user)
      end
      
      after :all do
        User.destroy_all
      end
 
    # let!(:category) { Category.create!(title: "Test Category")}
    # let!(:task) { Task.create!(name: "Test Task", body: "Test Body", task_date: Date.current, category_id: category.id) }

    describe "GET /show" do
        it "1. returns http success on /categories" do      
            category = Category.create!(title: "Test Category")
            task = Task.create!(name: "Test Task", body: "Test Body", task_date: Date.current, category_id: category.id)      
            get "/categories/#{category.id}"
            expect(response).to have_http_status(:success)
            expect(response).to have_http_status(200)                
        end
    end

    describe "GET /new" do
        it "2. returns http success on /categories/new" do
            category = Category.create!(title: "Test Category")
            task = Task.create!(name: "Test Task", body: "Test Body", task_date: Date.current, category_id: category.id)      
            get "/categories/#{category.id}/tasks/new"
            expect(response).to have_http_status(:success)
            expect(response).to have_http_status(200)
        end
    end

    describe "GET /edit" do
        it "3. returns http success on /categories/:id/edit" do
            category = Category.create!(title: "Test Category")
            task = Task.create!(name: "Test Task", body: "Test Body", task_date: Date.current, category_id: category.id)      
            get "/categories/#{category.id}/tasks/#{task.id}/edit"
            expect(response).to have_http_status(:success)
            expect(response).to have_http_status(200)
        end
    end

   describe "PATCH /edit" do
        it "4. returns http success on /categories/:id/edit" do
            category = Category.create!(title: "Test Category")
            task = Task.create!(name: "Test Task", body: "Test Body", task_date: Date.current, category_id: category.id)      
            patch "/categories/#{category.id}/tasks/#{task.id}", params: { task: { name: "Test Task", body: "Test Body", task_date: Date.current, category_id: category.id } }            
            expect(response).to have_http_status(302)
            expect(response).to redirect_to(category_path(category.id))
        end
    end

    describe "DELETE /destroy" do
        it "5. returns http success on deleting a task" do
            category = Category.create!(title: "Test Category")
            task = Task.create!(name: "Test Task", body: "Test Body", task_date: Date.current, category_id: category.id)      
            delete "/categories/#{category.id}/tasks/#{task.id}"            
            expect(response).to have_http_status(302)
            expect(response).to redirect_to(category_path(category.id))
        end
    end
end
