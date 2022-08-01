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
class BudgetTransaction < ApplicationRecord
  has_many :category_budget_transactions, dependent: :destroy
  belongs_to :user
  validates :name, presence: true, length: { minimum: 3, maximum: 50 }
  validates :amount, presence: true, numericality: { greater_than: 0 }
end
