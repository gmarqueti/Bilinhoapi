class Bill < ApplicationRecord
validates :value, :due_date, :billing_id, :status, presence: true
validates :status, inclusion: { in: %w(Aberta Atrasada Paga),
message: "%{value} is not a valid status" }


private
  def status_default
    self.status ||= 'Aberta'
  end
end