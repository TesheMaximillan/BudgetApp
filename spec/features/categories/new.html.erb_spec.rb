require 'rails_helper'

RSpec.describe "categories/new.html.erb", type: :feature do
  before(:example) do
    @user = build(:user)
    sign_in @user
  end

  it "displays header title 'NEW CATEGORY'" do
    visit(new_category_path)
    expect(page).to have_content('NEW CATEGORY')
  end

  it "Sees Create Button" do
    visit new_category_path
    expect(page).to have_button('Create')
  end

  it "Click Create Button with blank fields" do
    user = create(:user)
    sign_in user
    visit new_category_path
    click_button 'Create'
    expect(page).to have_current_path(categories_path)
  end

  it "Click Create Button with valid fields" do
    user = create(:user)
    sign_in user
    visit new_category_path
    fill_in 'Name', with: 'Test Category'
    click_button 'Create'
    expect(page).to have_current_path(categories_path)
  end
end
