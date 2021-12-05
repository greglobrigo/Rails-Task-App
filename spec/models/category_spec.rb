require 'rails_helper'

RSpec.describe Category, User, type: :model do  
  context "Validations" do

    it '1. Is not valid without a title (nil)' do
      expect(Category.new(title: nil)).to_not be_valid
    end

    it '2. Is not valid if title entered is less than 4 characters' do
      expect(Category.new(title: 'abc')).to_not be_valid
    end  

    it "3. Is not valid if title entered is not unique" do
      user = User.create(email: 'asdasd@email.com', password: 'asdasdasd')
      category = user.categories.create(title: 'abcdefg')
      category2 = user.categories.create(title: 'abcdefg')
      expect(category2).to_not be_valid
      expect(category2.errors.full_messages).to include("Title has already been taken")
    end

    it '4. It belongs to the users table' do
      expect(described_class.reflect_on_association(:user).macro).to eq(:belongs_to)
    end

    it '5. It has many tasks (has_many relationship)' do
      expect(described_class.reflect_on_association(:tasks).macro).to eq(:has_many)
    end   

  end
end

