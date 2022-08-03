# == Schema Information
#
# Table name: categories
#
#  id         :bigint           not null, primary key
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
FactoryBot.define do
  factory :category do
    user { User.first || create(:user) }
    name { "MyString" }

    link_to_default_icon = Rails.root.join('spec', 'factories', 'files', 'default_icon.jpg')
    icon { Rack::Test::UploadedFile.new(link_to_default_icon) }
  end
end
