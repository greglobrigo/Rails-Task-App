require 'rails_helper'

RSpec.describe User, type: :model do
    
    context 'Validations' do
        it "1. It has a valid factory" do
            expect(build(:user)).to be_valid
        end

        it "2. It validates presence of email" do
            expect(User.new(email: nil, password: "12345678")).to_not be_valid
        end

        it "3. It validates presence of password" do
            expect(User.new(email: "test123@email.com", password: nil)).to_not be_valid
        end

        it "4. It has many categories (has_many categories)" do
            expect(described_class.reflect_on_association(:categories).macro).to eq(:has_many)
        end

    end
  end
