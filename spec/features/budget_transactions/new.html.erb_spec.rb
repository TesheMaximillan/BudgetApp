require 'rails_helper'

RSpec.describe "categories/new.html.erb", type: :feature do
  before(:example) do
    @user = build(:user)
    @category = build(:category)
    @category.save
    sign_in @user
  end

  it "displays header title 'NEW NEW TRANSACTION'" do
    visit(new_category_budget_transaction_path(@category.id))
    expect(page).to have_content('NEW TRANSACTION')
  end

  it "Sees Create Button" do
    visit new_category_budget_transaction_path(@category.id)
    expect(page).to have_button('Create')
  end

  it "Click Create Button with blank fields" do
    user = create(:user)
    sign_in user
    visit new_category_budget_transaction_path(@category.id)
    click_button 'Create'
    expect(page).to have_current_path(new_category_budget_transaction_path(@category.id))
  end

  it "Click Create Button with invalid value" do
    user = create(:user)
    sign_in user
    visit new_category_budget_transaction_path(@category.id)
    fill_in 'Amount', with: '-1'
    click_button 'Create'
    expect(page).to have_current_path(new_category_budget_transaction_path(@category.id))
  end
end
