require 'rails_helper'

RSpec.describe "home/index", type: :view do
  describe "displays the Application name" do
    it "displays the name of the app" do
      visit(root_path)
      expect(Capybara.page).to have_content("Budget App")
    end
  end
end
