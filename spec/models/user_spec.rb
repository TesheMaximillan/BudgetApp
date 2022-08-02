# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  confirmation_sent_at   :datetime
#  confirmation_token     :string
#  confirmed_at           :datetime
#  email                  :string           not null
#  encrypted_password     :string           default(""), not null
#  name                   :string           not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  unconfirmed_email      :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_confirmation_token    (confirmation_token) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
require 'rails_helper'

RSpec.describe User, type: :model do
  describe "#valid?" do
    it "has a valid factory" do
      expect(build(:user)).to be_valid
    end

    it "is invalid without a name" do
      expect(build(:user, name: nil)).to_not be_valid
    end

    it "is invalid if a name is too long" do
      expect(build(:user, name: "a" * 51)).to_not be_valid
    end

    it "is invalid if a name is too short" do
      expect(build(:user, name: "a")).to_not be_valid
    end

    it "is invalid if a name is empty whitespace" do
      expect(build(:user, name: "     ")).to_not be_valid
    end

    it "is invalid without an email" do
      expect(build(:user, email: nil)).to_not be_valid
    end

    it "is invalid if the email is taken" do
      create(:user, email: "teshe@gmail.com")
      user = build(:user, email: "teshe@gmail.com")
      expect(user).to_not be_valid
    end

    it "is invalid if the email is not a valid email" do
      user = build(:user, email: "not an email")
      expect(user).to_not be_valid
    end
  end
end
