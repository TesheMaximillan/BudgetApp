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
  describe "#valid?" do
    context "when budget_transaction is valid" do
      it "is valid" do
        category_budget_transaction = build(:category_budget_transaction)
        expect(category_budget_transaction).to be_valid
      end

      it "is valid when budget_transaction is not unique" do
        create(:category_budget_transaction)
        category_budget_transaction = build(:category_budget_transaction)
        expect(category_budget_transaction).to be_valid
      end

      it "is valid when category is not unique" do
        create(:category_budget_transaction)
        category_budget_transaction = build(:category_budget_transaction)
        expect(category_budget_transaction).to be_valid
      end
    end
  end
end
