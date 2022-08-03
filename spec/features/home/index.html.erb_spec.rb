require 'rails_helper'

RSpec.describe "home/index", type: :feature do
  describe "displays the Application name" do
    it "displays the name of the app" do
      visit(root_path)
      expect(page).to have_content("Budget App")
    end
  end
end
