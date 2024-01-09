class Bill < ApplicationRecord
validates :value, presence: true
validates :due_date, presence: true
validates :billing_id, presence: true
validates :status, inclusion: { in: %w(Aberta Atrasada Paga) }, presence: true

before_validation :status_default

private
  def status_default
    self.status ||= 'Aberta'
  end
end