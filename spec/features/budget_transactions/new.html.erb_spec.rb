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
end
