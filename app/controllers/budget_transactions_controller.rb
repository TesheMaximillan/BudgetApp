class BudgetTransactionsController < ApplicationController
  def index
    @category = Category.find(params[:category_id])
    @budget_transactions = @category.budget_transactions.order(created_at: :desc)
  end

  def new
    @budget_transaction = BudgetTransaction.new
  end

  def create
    @category = Category.find(params[:category_id])
    @budget_transaction = BudgetTransaction.new(user: current_user, name: params[:name], amount: params[:amount])

    if @budget_transaction.save
      @category.budget_transactions << @budget_transaction
      redirect_to category_budget_transactions_path(category_id: @category.id),
                  notice: 'Budget transaction was successfully created.'
    else
      redirect_to new_category_budget_transaction_path(category_id: @category.id),
                  alert: 'Budget transaction was not created.'
    end
  end
end
