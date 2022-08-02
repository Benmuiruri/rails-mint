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

  def new
    @group = Group.new
  end

  def show
    @group = Group.includes(:expenses).find(params[:id])
  end
end
