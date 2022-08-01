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
require 'rails_helper'

RSpec.describe Category, type: :model do
  describe "#valid?" do
    context "when icon is valid" do
      it "is valid" do
        category = build(:category)
        expect(category).to be_valid
      end
    end

    context "when icon is invalid" do
      it "is invalid if icon is nil" do
        category = build(:category, icon: nil)
        expect(category).to be_invalid
      end

      it "is invalid if icon is not a URL" do
        category = build(:category, icon: "not a URL")
        expect(category).to_not be_valid
      end
    end
  end
end
