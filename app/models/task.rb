class Task < ApplicationRecord
    belongs_to :category
    validates :name, presence: true, length: { maximum: 50 }
    validates :body, presence: true
    validates :task_date, presence: true    
end
