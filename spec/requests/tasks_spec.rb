 require 'rails_helper'

RSpec.describe "Tasks HTTP Request & Responses", type: :request do    
    before do
        sign_in create(:user)
      end

    before do
        @category = User.last.categories.create(title: "Test Category")
        @task = @category.tasks.create(name: "Test Task", body: "Test Description", task_date: Date.today)
    end    

   describe "GET /new" do
    it "returns http success on show tasks" do
        get "/categories/#{@category.id}/tasks/new"
        expect(response).to have_http_status(200)      
    end     
  end   

  describe "GET /edit" do
    it "returns http success on edit tasks" do
        get "/categories/#{@category.id}/tasks/#{@task.id}/edit"
        expect(response).to have_http_status(200)
    end
  end
end
