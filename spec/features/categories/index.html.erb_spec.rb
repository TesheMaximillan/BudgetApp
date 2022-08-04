require 'rails_helper'

RSpec.describe "categories/index.html.erb", type: :feature do
  before(:example) do
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
end
