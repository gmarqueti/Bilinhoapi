class Student < ApplicationRecord
    validates :name, presence: true, uniqueness: true
    validates :cpf, presence: true, uniqueness: true, numericality: { only_integer: true }, length: { is: 11 }
    validates :gender, presence: true, inclusion: { in: %w(M F) }
    validates :method_type, presence: true, inclusion: { in: %w(Boleto Cartão) }
    validates :phone, numericality: { only_integer: true, allow_nil: true }
end
