# == Schema Information
#
# Table name: budget_transactions
#
#  id         :bigint           not null, primary key
#  amount     :decimal(, )      not null
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_budget_transactions_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe BudgetTransaction, type: :model do
  describe "#valid?" do
    context "when amount is valid" do
      it "is valid" do
        budget_transaction = build(:budget_transaction)
        expect(budget_transaction).to be_valid
      end
    end

    context "when amount is invalid" do
      it "is invalid if amount is nil" do
        budget_transaction = build(:budget_transaction, amount: nil)
        expect(budget_transaction).to be_invalid
      end

      it "is invalid if amount is negative" do
        budget_transaction = build(:budget_transaction, amount: -1)
        expect(budget_transaction).to be_invalid
      end

      it "is invalid if amount is string" do
        budget_transaction = build(:budget_transaction, amount: "string")
        expect(budget_transaction).to be_invalid
      end
    end
  end
end
