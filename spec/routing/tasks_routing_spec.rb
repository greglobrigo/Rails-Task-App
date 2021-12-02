require "rails_helper"

RSpec.describe TasksController, type: :routing do
  describe "routing" do   

    it "1. GET url: /categories/1/tasks/new routes to page to create new task" do
        expect(get: "/categories/1/tasks/new").to route_to("tasks#new", category_id: "1")
    end

    it "2. GET url: /categories/1/tasks/1/edit routes to tasks#edit to edit tasks" do
        expect(get: "/categories/1/tasks/1/edit").to route_to("tasks#edit", category_id: "1", id: "1")    
    end

    it "3. POST url: /categories/1/tasks routes to tasks#create to create new task via POST" do
        expect(post: "/categories/1/tasks").to route_to("tasks#create", category_id: "1")
    end

    it "4. PUT url: /categories/1/tasks/1 routes to tasks#update to update task via PUT" do
        expect(put: "/categories/1/tasks/1").to route_to("tasks#update", category_id: "1", id: "1")
    end

    it "5. PATCH url: /categories/1/tasks/1 routes to tasks#update to update tasks via PATCH" do
        expect(patch: "/categories/1/tasks/1").to route_to("tasks#update", category_id: "1", id: "1")
    end

    it "6. DELETE url: /categories/1/tasks/1 routes to tasks#destroy to delete tasks via DELETE" do
        expect(delete: "/categories/1/tasks/1").to route_to("tasks#destroy", category_id: "1", id: "1")
    end    
    
  end
end
