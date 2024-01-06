class Student < ApplicationRecord
    validates :name, :cpf, :gender, :method_type, presence: true
    validates :name, :cpf, uniqueness: true
    validates :name, :cpf, absence: true
    validates :cpf, numericality: { only_integer: true }
    validates :gender, inclusion: { in: %w(M F),
    message: "%{value} is not a valid gender" }
    validates :method_type, inclusion: { in: %w(Boleto Cartão),
    message: "%{value} is not a valid method_type" }
end
