class Payment < ApplicationRecord
  validates :month, :borrower_id, :payment, presence: true
  belongs_to :borrower

end