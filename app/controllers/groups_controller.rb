class GroupsController < ApplicationController

  def index
    if user_signed_in?
      @groups = Group.includes(:expenses).where(user: current_user)
    else
      render '/splash/welcome'
    end
  end
end
