# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  email      :string           not null
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#
require 'rails_helper'

RSpec.describe User, type: :model do
  def create_a_user(
    email: "#{SecureRandom.hex(4)}@example.com")
    User.create!(email: email, name: "John Doe")
  end

  describe "#valid?" do
    it "has a valid factory" do
      expect(create_a_user).to be_valid
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

    it "is invalid with a duplicate email" do
      create_a_user
      user = User.new
      user.email = "teshe@gmail.com"
      expect(user.valid?).to be false
    end

    it "is invalid if the email is taken" do
      create_a_user
      user = User.new
      user.email = "teshe@gmail.com"
      expect(user.valid?).to be false
    end

    it "is invalid if the email is not a valid email" do
      user = User.new
      user.email = "teshe"
      expect(user.valid?).to be false
    end
  end
end