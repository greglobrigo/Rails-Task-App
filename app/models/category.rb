class Category < ApplicationRecord
    has_many :tasks, dependent: :destroy
    validates :title, presence: true, length: { minimum: 4, maximum: 50 }, uniqueness: true
end
