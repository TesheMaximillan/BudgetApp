require 'rails_helper'

RSpec.describe "categories/index.html.erb", type: :feature do
  before(:example) do
    @user = build(:user)
    @category = build(:category)
    @category.save
    sign_in @user
  end

  it "displays header title 'CATEGORIES'" do
    visit(category_budget_transactions_path(@category.id))
    expect(page).to have_content('TRANSACTIONS')
  end

  it "Sees Add Transaction Link" do
    visit(category_budget_transactions_path(@category.id))
    expect(page).to have_link('Add Transaction')
  end
end
