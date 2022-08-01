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

    context "when budget_transaction is invalid" do
      it "is invalid if budget_transaction is not specified" do
        category_budget_transaction = build(:category_budget_transaction, budget_transaction: nil)
        expect(category_budget_transaction).to be_invalid
      end

      it "is invalid if budget_transaction is not a number" do
        category_budget_transaction = build(:category_budget_transaction, budget_transaction_id: "not a number")
        expect(category_budget_transaction).to be_invalid
      end

      it "is invalid if budget_transaction is negative" do
        category_budget_transaction = build(:category_budget_transaction, budget_transaction_id: -1)
        expect(category_budget_transaction).to be_invalid
      end

      it "is invalid if category is not specified" do
        category_budget_transaction = build(:category_budget_transaction, category: nil)
        expect(category_budget_transaction).to be_invalid
      end

      it "is invalid if category is not a number" do
        category_budget_transaction = build(:category_budget_transaction, category_id: "not a number")
        expect(category_budget_transaction).to be_invalid
      end

      it "is invalid if category is negative" do
        category_budget_transaction = build(:category_budget_transaction, category_id: -1)
        expect(category_budget_transaction).to be_invalid
      end
    end
  end
end
