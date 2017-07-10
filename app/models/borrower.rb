class Borrower < ApplicationRecord
  has_many :payments
end