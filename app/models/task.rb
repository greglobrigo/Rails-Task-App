class Task < ApplicationRecord
    belongs_to :category
    validates :name, presence: true
    validates :body, presence: true
    validates :task_date, presence: true
end
