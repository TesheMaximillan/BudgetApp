class CreateBudgetTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :budget_transactions do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name, null: false
      t.decimal :amount, null: false

      t.timestamps
    end
  end
end
