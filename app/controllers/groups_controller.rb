class GroupsController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    if user_signed_in?
      @groups = Group.includes(:expenses).where(user: current_user)
      @total_expenses = Expense.where(author: current_user).sum(&:amount)
      @categories = @groups.count
    else
      render '/splash/welcome'
    end
  end

  def show
    @group = Group.includes(:expenses).find(params[:id])
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.user = current_user
    if @group.save
      redirect_to root_path, notice: 'New category added successfully'
    else
      flash[:alert] = 'Something went wrong, category not created'
      render :new, status: :unprocessable_entity
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
