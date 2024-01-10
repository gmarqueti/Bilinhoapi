require 'date'

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
    bill_value = total_value/installments #total de faturas
    today_day = Date.today.day
    
    due_day = due_day.to_i #garantindo que due_day é um inteiro
    new_due_day =  #pegando o dia certo
    

    if due_day <= today_day
      due_date = Date.new(Date.today.year, Date.today.month + 1, due_day)
    else
      due_date = Date.new(Date.today.year, Date.today.month, due_day)
    end

    while Bill.find_by(due_date: due_date, billing_id: id).present?
      due_date = due_date.next_month  # Se encontrar data de vencimento igual a due day, atualiza para o próximo mês
    end

    Bill.create(value:bill_value, due_date:due_date, billing_id: id) #cria a primeira fatura 
    installments -= 1

    installments.each do |installment|
      due_date = due_date.next_month
      Bill.create(value:bill_value,due_date:due_date,billing_id: id)
    end
  end
end


