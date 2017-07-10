class CreatePayment < ActiveRecord::Migration[5.1]
  def change
    create_table :payments do |t|
      t.integer :borrower_id
      t.integer :month
      t.integer :payment
      t.timestamps
    end
  end
end
