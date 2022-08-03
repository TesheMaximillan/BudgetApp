class CategoriesBudgetTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :categories_budget_transactions, id: false do |t|
      t.belongs_to :category, index: true
      t.belongs_to :budget_transaction, index: true
    end
  end
end
