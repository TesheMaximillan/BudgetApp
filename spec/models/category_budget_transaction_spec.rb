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
require 'rails_helper'

RSpec.describe CategoryBudgetTransaction, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
