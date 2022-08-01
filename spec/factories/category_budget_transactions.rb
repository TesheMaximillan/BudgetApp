# == Schema Information
#
# Table name: category_budget_transactions
#
#  id                    :bigint           not null, primary key
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  budget_transaction_id :bigint           not null
#  category_id           :bigint           not null
#
# Indexes
#
#  index_category_budget_transactions_on_budget_transaction_id  (budget_transaction_id)
#  index_category_budget_transactions_on_category_id            (category_id)
#
# Foreign Keys
#
#  fk_rails_...  (budget_transaction_id => budget_transactions.id)
#  fk_rails_...  (category_id => categories.id)
#
FactoryBot.define do
  factory :category_budget_transaction do
    category { Category.first || create(:category) }
    budget_transaction { BudgetTransaction.first || create(:budget_transaction) }
  end
end
