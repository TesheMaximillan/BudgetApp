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
require 'rails_helper'

RSpec.describe Category, type: :model do
  describe "#valid?" do
    context "when icon is valid" do
      it "is valid" do
        category = build(:category)
        expect(category).to be_valid
      end
    end

    context "when user_id is valid" do
      it "is valid user_id is not nil" do
        category = build(:category)
        expect(category).to be_valid
      end

      it "is valid when user_id is not unique" do
        create(:category)
        category = build(:category)
        expect(category).to be_valid
      end
    end

    context "is invalid user_id is invalid" do
      it "is invalid when user_id is nil" do
        category = build(:category, user_id: nil)
        expect(category).to be_invalid
      end

      it "is invalid if user_id is string" do
        budget_transaction = build(:budget_transaction, user_id: "string")
        expect(budget_transaction).to be_invalid
      end

      it "is invalid if user_id is negative" do
        budget_transaction = build(:budget_transaction, user_id: -1)
        expect(budget_transaction).to be_invalid
      end
    end

    context "when name is valid" do
      it "is valid when name is not nil" do
        category = build(:category)
        expect(category).to be_valid
      end
    end

    context "when name is invalid" do
      it "is invalid when name is nil" do
        category = build(:category, name: nil)
        expect(category).to be_invalid
      end

      it "is invalid when name is empty string" do
        category = build(:category, name: "")
        expect(category).to be_invalid
      end

      it "is invalid when name is too long" do
        category = build(:category, name: "a" * 51)
        expect(category).to be_invalid
      end

      it "is invalid when name is too short" do
        category = build(:category, name: "a")
        expect(category).to be_invalid
      end

      it "is invalid when name is empty whitespace" do
        category = build(:category, name: "     ")
        expect(category).to be_invalid
      end
    end
  end
end
