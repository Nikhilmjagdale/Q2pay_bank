class BankAccount < ApplicationRecord
  belongs_to :user
  validates :account_number, presence: true, uniqueness: { scope: :ifsc_code }
  validates :ifsc_code, presence: true
  validates :balance, numericality: { in: 0.01..99999999.99 }

  def add_money(amount: 0, execution_date: Date.today, remarks:nill)
    bank_account_id = id,
    operation: 'credit',
    amount: amount,
    execution_date: execution_date,
    remarks: remarks
  end
end
