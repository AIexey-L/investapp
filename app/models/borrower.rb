class Borrower < ApplicationRecord
  validates :name, :loan, :period, :annual_rate, :overdue_rate, presence: true
  has_many :payments
end
