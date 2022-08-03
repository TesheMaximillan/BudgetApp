# == Schema Information
#
# Table name: categories
#
#  id         :bigint           not null, primary key
#  icon       :binary           not null
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_categories_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Category < ApplicationRecord
  has_and_belongs_to_many :budget_transactions, dependent: :destroy
  belongs_to :user
  has_one_attached :icon
  validates :name, presence: true, length: { minimum: 3, maximum: 50 }
  validates :icon, presence: true
end
