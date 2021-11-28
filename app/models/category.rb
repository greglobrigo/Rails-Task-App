class Category < ApplicationRecord
    validates :title, presence: true, length: { minimum: 4, maximum: 50 }, uniqueness: true
end
