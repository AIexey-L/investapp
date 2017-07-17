class Payment < ApplicationRecord
  validates :borrower_id, :payment, presence: true
  validates :month, presence: true, uniqueness: { scope: :borrower_id }
  belongs_to :borrower
end
