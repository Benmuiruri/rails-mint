class ExpensesController < ApplicationController
  before_action :authenticate_user!

  def new
    @expense = Expense.new
    @categories = current_user.groups
    @group_id = params[:group_id]
  end

  def create
    @expense = Expense.new(expense_params)
    @expense.author = current_user
    @group = Group.find(expense_params[:groups_ids])
    if @expense.save
      @expense.groups.push(@group)
      redirect_to group_path(@group), notice: 'New category added successfully'
    else
      flash[:alert] = 'Something went wrong, category not created'
      render :new, status: :unprocessable_entity
    end
  end

  private 

  def expense_params
    params.require(:expense).permit(:name, :amount, :groups_ids)
  end
end
