require 'rails_helper'

RSpec.describe "categories/index.html.erb", type: :feature do
  before(:each) do
    @user = build(:user)
    sign_in @user
  end

  it "displays header title 'CATEGORIES'" do
    visit(categories_path)
    expect(page).to have_content('CATEGORIES')
  end

  it "Sees Add Category Link" do
    visit categories_path
    expect(page).to have_link('Add Category')
  end

  it "Click link Add Category" do
    user = create(:user)
    sign_in user
    visit categories_path
    click_link 'Add Category'
    expect(page).to have_current_path(new_category_path)
  end

  it "Click link Add Category" do
    user = create(:user)
    sign_in user
    visit categories_path
    click_link 'Add Category'
    expect(page).to have_content('NEW CATEGORY')
  end
end
