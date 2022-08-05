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
  describe '#valid?' do
    context 'when amount is valid' do
      it 'is valid' do
        budget_transaction = build(:budget_transaction)
        expect(budget_transaction).to be_valid
      end
    end

    context 'when amount is invalid' do
      it 'is invalid if amount is nil' do
        budget_transaction = build(:budget_transaction, amount: nil)
        expect(budget_transaction).to be_invalid
      end

      it 'is invalid if amount is negative' do
        budget_transaction = build(:budget_transaction, amount: -1)
        expect(budget_transaction).to be_invalid
      end

      it 'is invalid if amount is string' do
        budget_transaction = build(:budget_transaction, amount: 'string')
        expect(budget_transaction).to be_invalid
      end
    end

    context 'when name is valid' do
      it 'is valid' do
        budget_transaction = build(:budget_transaction)
        expect(budget_transaction).to be_valid
      end
    end

    context 'when name is invalid' do
      it 'is invalid if name is nil' do
        budget_transaction = build(:budget_transaction, name: nil)
        expect(budget_transaction).to be_invalid
      end

      it 'is invalid if name is empty' do
        budget_transaction = build(:budget_transaction, name: '')
        expect(budget_transaction).to be_invalid
      end

      it 'is invalid if name is too many whitespace' do
        budget_transaction = build(:budget_transaction, name: '   ')
        expect(budget_transaction).to be_invalid
      end

      it 'is invalid if name is too long' do
        budget_transaction = build(:budget_transaction, name: 'a' * 51)
        expect(budget_transaction).to be_invalid
      end

      it 'is invalid if name is too short' do
        budget_transaction = build(:budget_transaction, name: 'a')
        expect(budget_transaction).to be_invalid
      end
    end

    context 'when user_id is valid' do
      it 'is valid' do
        budget_transaction = build(:budget_transaction)
        expect(budget_transaction).to be_valid
      end

      it 'is valid if user_id is not unique' do
        create(:budget_transaction)
        budget_transaction = build(:budget_transaction)
        expect(budget_transaction).to be_valid
      end
    end

    context 'when user_id is invalid' do
      it 'is invalid if user_id is nil' do
        budget_transaction = build(:budget_transaction, user_id: nil)
        expect(budget_transaction).to be_invalid
      end

      it 'is invalid if user_id is string' do
        budget_transaction = build(:budget_transaction, user_id: 'string')
        expect(budget_transaction).to be_invalid
      end

      it 'is invalid if user_id is negative' do
        budget_transaction = build(:budget_transaction, user_id: -1)
        expect(budget_transaction).to be_invalid
      end
    end
  end
end
