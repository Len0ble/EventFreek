class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:show]

  def show
  end
  
  def profile
    @user = current_user
  end

  private

  def correct_user
    redirect_to root_url unless current_user == User.find(params[:id])
  end
end
