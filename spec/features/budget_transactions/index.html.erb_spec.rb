require 'rails_helper'

RSpec.describe 'categories/index.html.erb', type: :feature do
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

  it 'Sees Add Transaction Link' do
    visit(category_budget_transactions_path(@category.id))
    expect(page).to have_link('Add Transaction')
  end

  it 'Click link Add Transaction' do
    user = create(:user)
    sign_in user
    visit category_budget_transactions_path(@category.id)
    click_link 'Add Transaction'
    expect(page).to have_current_path(new_category_budget_transaction_path(@category.id))
  end

  it 'Click link Add Transaction' do
    user = create(:user)
    sign_in user
    visit category_budget_transactions_path(@category.id)
    click_link 'Add Transaction'
    expect(page).to have_content('NEW TRANSACTION')
  end
end
