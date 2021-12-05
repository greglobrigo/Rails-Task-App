require 'rails_helper'

RSpec.describe Task, type: :model do   
  
  context "Validations" do
    it "1. Is not valid without a title" do
      expect(Task.new(name: nil, body: "body", task_date: Date.today, category_id: 1)).to_not be_valid
    end

    it "2. Is not valid without a body" do
      expect(Task.new(name: "name", body: nil, task_date: Date.today, category_id: 1)).to_not be_valid
    end

    it "3. Is not valid without a task_date" do
      expect(Task.new(name: "name", body: "body", task_date: nil, category_id: 1)).to_not be_valid
    end

    it "4. Is not valid without a category_id" do
      expect(Task.new(name: "name", body: "body", task_date: Date.today, category_id: nil)).to_not be_valid
    end

    it "5. Its name length does not exceed 50 characters" do
      expect(Task.new(name: "a"*51, body: "Body", task_date: Time.now, category_id: 1)).to_not be_valid
    end

    it "6. It belongs to the categories table (belongs_to)" do
      expect(described_class.reflect_on_association(:category).macro).to eq(:belongs_to)
    end
   
  end 
end
