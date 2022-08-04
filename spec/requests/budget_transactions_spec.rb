require 'rails_helper'

RSpec.describe 'BudgetTransactions', type: :request do
  before(:example) do
    @user = build(:user)
    @category = build(:category)
    @category.save
    sign_in @user
  end

  describe 'GET #index' do
    it 'returns http success' do
      get category_budget_transactions_path(@category.id)
      expect(response).to have_http_status(:success)
    end

    it 'renders the index template' do
      get category_budget_transactions_path(@category.id)
      expect(response).to render_template('index')
    end
  end

  describe 'GET #new' do
    it 'returns http success' do
      get new_category_budget_transaction_path(@category.id)
      expect(response).to have_http_status(:success)
    end

    it 'renders the new template' do
      get new_category_budget_transaction_path(@category.id)
      expect(response).to render_template('new')
    end
  end
end
