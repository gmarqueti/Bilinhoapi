class Institution < ApplicationRecord
    validates :name, presence: true, uniqueness: true
    validates :cnpj, presence: true, uniqueness: true, numericality: { only_integer: true }, length: { is: 14 }
    validates :kind, presence: true, inclusion: { in: %w[Universidade Escola Creche] }
end