class ChangeDatatypeForPercentToFloat < ActiveRecord::Migration[5.1]
  def change
    change_column :borrowers, :annual_rate, :float
    change_column :borrowers, :overdue_rate, :float
  end
end
