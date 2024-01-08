class Billing < ApplicationRecord
    belongs_to :institution
    belongs_to :student
    validates :total_value, presence: true, numericality: {grater_than: 0}
    validates :installments, presence: true, numericality: {greater_than_or_equal_to: 1}
    validates :due_day, presence: true, numericality: {greater_than_or_equal_to: 1, less_than:32}
    validates :course_name, presence: true
    validates :institution_id, presence: true
    validates :student_id, presence: true
end