class GroupsController < ApplicationController

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
    @group = Group.includes(:payments).find(params[:id])
  end
end
