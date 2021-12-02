 require 'rails_helper'

RSpec.describe "Tasks HTTP Request & Responses", type: :request do

    let!(:category) { Category.create!(title: "Test Category") }
    let!(:task) { Task.create!(name: "Test Task", body: "Test Body", task_date: Date.current, category_id: category.id) }

    describe "GET /show" do
        it "1. returns http success on /categories" do            
            get "/categories/#{category.id}"
            expect(response).to have_http_status(:success)
            expect(response).to have_http_status(200)                
        end
    end

    describe "GET /new" do
        it "2. returns http success on /categories/new" do
            get "/categories/#{category.id}/tasks/new"
            expect(response).to have_http_status(:success)
            expect(response).to have_http_status(200)
        end
    end

    describe "GET /edit" do
        it "3. returns http success on /categories/:id/edit" do
            get "/categories/#{category.id}/tasks/#{task.id}/edit"
            expect(response).to have_http_status(:success)
            expect(response).to have_http_status(200)
        end
    end

   describe "PATCH /edit" do
        it "4. returns http success on /categories/:id/edit" do
            patch "/categories/#{category.id}/tasks/#{task.id}", params: { task: { name: "Test Task", body: "Test Body", task_date: Date.current, category_id: category.id } }            
            expect(response).to have_http_status(302)
            expect(response).to redirect_to(category_path(category.id))
        end
    end

    describe "DELETE /destroy" do
        it "5. returns http success on deleting a task" do
            delete "/categories/#{category.id}/tasks/#{task.id}"            
            expect(response).to have_http_status(302)
            expect(response).to redirect_to(category_path(category.id))
        end
    end








#   describe "GET /index" do
#     it "renders a successful response" do
#       Task.create! valid_attributes
#       get tasks_url
#       expect(response).to be_successful
#     end
#   end

#   describe "GET /show" do
#     it "renders a successful response" do
#       task = Task.create! valid_attributes
#       get task_url(task)
#       expect(response).to be_successful
#     end
#   end

#   describe "GET /new" do
#     it "renders a successful response" do
#       get new_task_url
#       expect(response).to be_successful
#     end
#   end

#   describe "GET /edit" do
#     it "render a successful response" do
#       task = Task.create! valid_attributes
#       get edit_task_url(task)
#       expect(response).to be_successful
#     end
#   end

#   describe "POST /create" do
#     context "with valid parameters" do
#       it "creates a new Task" do
#         expect {
#           post tasks_url, params: { task: valid_attributes }
#         }.to change(Task, :count).by(1)
#       end

#       it "redirects to the created task" do
#         post tasks_url, params: { task: valid_attributes }
#         expect(response).to redirect_to(task_url(Task.last))
#       end
#     end

#     context "with invalid parameters" do
#       it "does not create a new Task" do
#         expect {
#           post tasks_url, params: { task: invalid_attributes }
#         }.to change(Task, :count).by(0)
#       end

#       it "renders a successful response (i.e. to display the 'new' template)" do
#         post tasks_url, params: { task: invalid_attributes }
#         expect(response).to be_successful
#       end
#     end
#   end

#   describe "PATCH /update" do
#     context "with valid parameters" do
#       let(:new_attributes) {
#         skip("Add a hash of attributes valid for your model")
#       }

#       it "updates the requested task" do
#         task = Task.create! valid_attributes
#         patch task_url(task), params: { task: new_attributes }
#         task.reload
#         skip("Add assertions for updated state")
#       end

#       it "redirects to the task" do
#         task = Task.create! valid_attributes
#         patch task_url(task), params: { task: new_attributes }
#         task.reload
#         expect(response).to redirect_to(task_url(task))
#       end
#     end

#     context "with invalid parameters" do
#       it "renders a successful response (i.e. to display the 'edit' template)" do
#         task = Task.create! valid_attributes
#         patch task_url(task), params: { task: invalid_attributes }
#         expect(response).to be_successful
#       end
#     end
#   end

#   describe "DELETE /destroy" do
#     it "destroys the requested task" do
#       task = Task.create! valid_attributes
#       expect {
#         delete task_url(task)
#       }.to change(Task, :count).by(-1)
#     end

#     it "redirects to the tasks list" do
#       task = Task.create! valid_attributes
#       delete task_url(task)
#       expect(response).to redirect_to(tasks_url)
#     end
#   end
end
