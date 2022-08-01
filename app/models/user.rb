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
class User < ApplicationRecord
  has_many :categories, dependent: :destroy
  has_many :budget_transactions, dependent: :destroy
  validates :name, presence: true, length: { minimum: 3, maximum: 50 }
  validates :email, presence: true, format: { with:  URI::MailTo::EMAIL_REGEXP,
                                              message: "Must be a valid email address" },
            uniqueness: { case_sensitive: false, unique: true }
end
