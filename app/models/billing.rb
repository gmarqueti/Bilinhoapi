class Billing < ApplicationRecord
    belongs_to :institution
    belongs_to :student
    validates :total_value, presence: true, numericality: {grater_than: 0}
    validates :installments, presence: true, numericality: {greater_than_or_equal_to: 1}
    validates :due_day, presence: true, numericality: {greater_than_or_equal_to: 1, less_than:32}
    validates :course_name, presence: true
    validates :institution_id, presence: true
    validates :student_id, presence: true

    after_create :bill_create

    private 
    def bill_create

    #Bill(id: integer, value: float, due_date: date, billing_id: integer, status: string) colunas Bill

        bill_value = total_value/installments #total de faturas

        if due_day <= Date.today
            due_day = due_day.next_month #se a data de vencimento for menor ou igual a data de hoje, ele joga o vencimento para o próximo mês
            
        while Bill.find_by(due_date: due_day, billing_id: id).present?
            due_day = due_day.next_month  # Se encontrar data de vencimento igual a due day, atualiza para o próximo mês
        end

        Bill.create(value:bill_value,due_date:due_day,billing_id: id) #cria a primeira fatura 
        installments -= 1

        i= 0
        while i < installments do #estrutura de repetição para criar a quantidade de faturas restantes
            due_day = due_day.next_month
            Bill.create(value:bill_value,due_date:due_day,billing_id: id)
            i += 1
        end
    end
end
