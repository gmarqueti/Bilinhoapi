class Billing < ApplicationRecord
    validates :total_value, :installments, :due_day, :course_name, :instituion_id, :student_id, presence: true
    validates :installments, :due_day, numericality: {greater_than_or_equal_to: 1}
    validates :total_value, numericality: {grater_than: 0}
    validates :due_day, numericality: {less_than: 32}

end
