class GroupsController < ApplicationController
  def index
    render '/splash/welcome' unless user_signed_in?
  end
end
