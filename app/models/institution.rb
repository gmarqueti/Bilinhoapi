class Institution < ApplicationRecord
    validates :name, :cnpj, :kind, presence: true
    validates :name, :cnpj, uniqueness: true
    validates :cnpj, numericality: { only_integer: true }
    validates :name, absence: true
    validates :kind, inclusion: { in: %w(Universidade Escola Creche),
    message: "%{value} is not a valid type" }
end