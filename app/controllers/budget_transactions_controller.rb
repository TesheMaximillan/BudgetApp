class BudgetTransactionsController < ApplicationController
  def index
    @category = Category.find(params[:category_id])
    @budget_transactions = @category.budget_transactions
  end

  def new
    @budget_transaction = BudgetTransaction.new
  end

  def create
    @category = Category.find(params[:category_id])
    @budget_transaction = BudgetTransaction.new(name: params[:name], amount: params[:amount])
    @budget_transaction.user_id = current_user.id
    if @budget_transaction.save
      @category.budget_transactions << @budget_transaction
      redirect_to category_budget_transactions_path(category_id: @category.id), notice: 'Budget transaction was successfully created.'
    else
      render :new, alert: 'Budget transaction was not created.'
    end
  end
end
