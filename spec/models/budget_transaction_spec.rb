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
  pending "add some examples to (or delete) #{__FILE__}"
end
