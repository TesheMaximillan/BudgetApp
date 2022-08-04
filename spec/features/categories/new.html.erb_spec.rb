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
end
