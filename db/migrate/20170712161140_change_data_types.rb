class ChangeDataTypes < ActiveRecord::Migration[5.1]
  def change
    change_column :borrowers, :loan, :float
    change_column :payments, :payment, :float
  end
end
