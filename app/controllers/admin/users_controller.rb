
module Admin
    class UsersController < ApplicationController
      before_action :authenticate_user!
      before_action :verify_admin
  
      def index
        @users = User.all
      end
  
      def show
        @user = User.find(params[:id])
      end
  
      def new
        @user = User.new
      end
  
      def create
        @user = User.new(user_params)
        if @user.save
          redirect_to admin_user_path(@user), notice: 'User was successfully created.'
        else
          render :new
        end
      end
  
      def edit
        @user = User.find(params[:id])
      end
  
      def update
        @user = User.find(params[:id])
        if @user.update(user_params)
          redirect_to admin_user_path(@user), notice: 'User was successfully updated.'
        else
          render :edit
        end
      end
  
      def destroy
        @user = User.find(params[:id])
        @user.destroy
        redirect_to admin_users_path, notice: 'User was successfully deleted.'
      end
  
      def promote_to_admin
        @user = User.find(params[:id])
        if @user.update(admin: true)
          redirect_to admin_users_path, notice: 'User was successfully promoted to admin.'
        else
          redirect_to admin_users_path, alert: 'Failed to promote user to admin.'
        end
      end
  
      private
  
      def verify_admin
        redirect_to(main_app.root_path) unless current_user.admin?
      end
  
      def user_params
        params.require(:user).permit(:email, :password, :password_confirmation, :admin)
      end
    end
  end
  