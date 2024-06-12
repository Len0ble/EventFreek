class Admin::DashboardController < ApplicationController
  before_action :authenticate_user!
  before_action :verify_admin

  def index
    @users = User.all
    @events = Event.all
  end

  private

  def verify_admin
    redirect_to(root_path) unless current_user.admin?
  end
end
