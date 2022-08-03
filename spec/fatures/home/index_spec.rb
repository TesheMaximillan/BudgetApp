require 'rails_helper'

RSpec.describe "home/index" do
  describe "displays home page" do
    it "displays the name of the app" do
      visit('/')
      expect(page).to have_content("Budget App")
    end
  end
end
