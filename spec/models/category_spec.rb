require 'rails_helper'

RSpec.describe Category, type: :model do   
  
  context "Validations" do

    it '1. Is not valid without a title (nil)' do
      expect(Category.new(title: nil)).to_not be_valid
    end

    it '2. Is not valid if title entered is less than 4 characters' do
      expect(Category.new(title: 'abc')).to_not be_valid
    end

    it '3. Is not valid if title entered is not unique' do      
      first_category = Category.create(title: 'abcd')
      second_category = Category.create(title: 'abcd')
      expect(second_category).to_not be_valid
    end      
  end

  context "Functionalities" do
    it '1. Can be created' do
      current_category_count = Category.count
      test_create_category = Category.create(title: 'abcd')
      expect(Category.last).to eq(test_create_category)
      expect(Category.count).to eq(current_category_count + 1)
    end

    it '2. Can be read' do
      test_read_category = Category.create(title: 'test')
      expect(test_read_category.title).to eq('test')
    end

    it '3. Can be updated' do
      test_update_category = Category.create(title: 'test')
      test_update_category.update(title: 'updated')
      expect(test_update_category.title).to eq('updated')
    end

    it '4. Can be deleted' do
      current_category_count = Category.count
      test_delete_category = Category.create(title: 'testdelete')
      test_delete_category.destroy
      expect(Category.count).to eq(current_category_count)
      expect(test_delete_category.destroyed?).to eq(true)
    end

  end
end
