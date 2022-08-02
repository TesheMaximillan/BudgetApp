require 'rails_helper'

RSpec.describe "Categories", type: :request do
  before(:example) do
    @user= build(:user)
    sign_in @user
  end

  describe "GET #index" do
    it "returns http success" do
      get categories_path
      expect(response).to have_http_status(:success)
    end

    it "renders the index template" do
      get categories_path
      expect(response).to render_template("index")
    end
  end
end
