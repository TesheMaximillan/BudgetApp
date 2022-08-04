# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  confirmation_sent_at   :datetime
#  confirmation_token     :string
#  confirmed_at           :datetime
#  email                  :string           default(""), not null
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
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#valid?' do
    it 'has a valid factory' do
      expect(build(:user)).to be_valid
    end

    it 'is invalid without a name' do
      expect(build(:user, name: nil)).to_not be_valid
    end

    it 'is invalid if a name is too long' do
      expect(build(:user, name: 'a' * 51)).to_not be_valid
    end

    it 'is invalid if a name is too short' do
      expect(build(:user, name: 'a')).to_not be_valid
    end

    it 'is invalid if a name is empty whitespace' do
      expect(build(:user, name: '     ')).to_not be_valid
    end

    it 'is invalid without an email' do
      expect(build(:user, email: nil)).to_not be_valid
    end

    it 'is invalid if the email is taken' do
      create(:user, email: 'teshe@gmail.com')
      user = build(:user, email: 'teshe@gmail.com')
      expect(user).to_not be_valid
    end

    it 'is invalid if the email is not a valid email' do
      user = build(:user, email: 'not an email')
      expect(user).to_not be_valid
    end
  end

  describe '#password' do
    it 'is invalid if the password is too short' do
      user = build(:user, password: 'a' * 5)
      expect(user).to_not be_valid
    end

    it 'is invalid if the password is too long' do
      user = build(:user, password: 'a' * 21)
      expect(user).to_not be_valid
    end

    it 'is invalid if the password is empty whitespace' do
      user = build(:user, password: '     ')
      expect(user).to_not be_valid
    end

    it 'is invalid if the password is empty' do
      user = build(:user, password: nil)
      expect(user).to_not be_valid
    end
  end

  describe '#password_confirmation' do
    it 'is invalid if the password_confirmation is not the same as the password' do
      user = build(:user, password_confirmation: 'not the same')
      expect(user).to_not be_valid
    end

    it 'is invalid if the password_confirmation is empty' do
      user = build(:user, password_confirmation: nil)
      expect(user).to_not be_valid
    end

    it 'is invalid if the password_confirmation is empty whitespace' do
      user = build(:user, password_confirmation: '     ')
      expect(user).to_not be_valid
    end
  end
end
