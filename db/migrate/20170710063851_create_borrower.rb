class CreateBorrower < ActiveRecord::Migration[5.1]
  def change
    create_table :borrowers do |t|
      t.string :name
      t.integer :loan
      t.integer :period
      t.integer :annual_rate
      t.integer :overdue_rate
      t.timestamps
    end
  end
end
