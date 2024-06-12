# app/controllers/admin/event_submissions_controller.rb
module Admin
    class EventSubmissionsController < ApplicationController
      before_action :authenticate_user!
      before_action :verify_admin
  
      def index
        @events = Event.where(reviewed: false)
      end
  
      def show
        @event = Event.find(params[:id])
      end
  
      def edit
        @event = Event.find(params[:id])
      end
  
      def update
        @event = Event.find(params[:id])
        if @event.update(event_params)
          redirect_to admin_event_submissions_path, notice: 'Event was successfully updated.'
        else
          render :edit
        end
      end
  
      private
  
      def verify_admin
        redirect_to(root_path) unless current_user.admin?
      end
  
      def event_params
        params.require(:event).permit(:validated, :reviewed)
      end
    end
  end
  