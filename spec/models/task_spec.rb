require 'rails_helper'

RSpec.describe Task, type: :model do   
  
  context "Validations" do
    it "1. is valid only with valid attributes" do      
      category = Category.first
      category.tasks.new(name: "Task 1", body: "Description 1", task_date: Time.now)
      expect(category).to be_valid
    end    
  end

  context "Functionalities" do
    it '1. Can be created' do
      task_count = Task.count
      category = Category.first
      category.tasks.new(name: "Task 1", body: "Description 1", task_date: Time.now).save      
      expect(category).to be_valid
      expect(Task.count).to eq(task_count + 1)
    end

    it '2. Can be read' do
      category = Category.first
      time = Time.now
      test_read_task = category.tasks.new(name: "Task 1", body: "Description 1", task_date: time).save
      expect(category.tasks.last.name).to eq("Task 1")
      expect(category.tasks.last.body).to eq("Description 1")      
    end

    it '3. Can be updated' do
      category = Category.first
      test_update_task = category.tasks.new(name: "Task 1", body: "Description 1", task_date: Time.now).save
      category.tasks.last.update(name: "Task 2", body: "Description 2")
      expect(category.tasks.last.name).to eq("Task 2")
      expect(category.tasks.last.body).to eq("Description 2")
    end

    it '4. Can be deleted' do      
      category = Category.first
      category.tasks.new(name: "Task 1", body: "Description 1", task_date: Time.now).save    
      category.tasks.find_by(name: "Task 1").destroy
      expect(category.tasks.find_by(name: "Task 1")).to be_nil  
    end
  end

 
end
