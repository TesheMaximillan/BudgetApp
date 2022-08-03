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
    @budget_transaction = BudgetTransaction.new(user: current_user, name: budget_transaction_params[:name], amount: budget_transaction_params[:amount])
    if @budget_transaction.save
      @category.budget_transactions << @budget_transaction
      redirect to category_budget_transactions_path(category_id: @category.id), notice: 'Budget transaction was successfully created.'
    else
      render :new, alert: 'Budget transaction was not created.'
    end
  end

  private

  def budget_transaction_params
    params.require(:budget_transaction).permit(:name, :amount)
  end
end
