class Payment < ApplicationRecord
  validates :name, :loan, :period, :annual_rate, :overdue_rate, presence: true
  belongs_to :borrower

end