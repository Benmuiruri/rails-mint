class ExpensesController < ApplicationController
  before_action :authenticate_user!

  def new
    @expense = Expense.new
    @groups = current_user.groups
    @group_id = params[:group_id]
    @back_group_path = {
      target: group_path(@group_id)
    }
  end

  def create
    @groups = current_user.groups
    params = expense_params
    @expense = Expense.new(name: params[:name], amount: params[:amount])
    @expense.author = current_user

    if @expense.save
      @group = Group.find(expense_params[:group_id])
      @expense.groups << @group
      redirect_to group_path(@group), notice: 'New category added successfully'
    else
      flash[:alert] = 'Something went wrong, category not created'
      render :new, status: :unprocessable_entity
    end
  end

  private

  def expense_params
    params.require(:expense).permit(:name, :amount, :group_id)
  end
end
