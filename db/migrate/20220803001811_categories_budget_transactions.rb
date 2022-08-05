class CategoriesBudgetTransactions < ActiveRecord::Migration[7.0]
  def change
    create_join_table :categories, :budget_transactions
  end
end
