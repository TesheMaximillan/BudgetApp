# == Schema Information
#
# Table name: categories
#
#  id         :bigint           not null, primary key
#  icon       :string           not null
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
FactoryBot.define do
  factory :category do
    user { nil }
    icon { "MyString" }
  end
end
