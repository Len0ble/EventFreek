# app/controllers/admin/events_controller.rb
module Admin
    class EventsController < ApplicationController
      before_action :authenticate_user!
      before_action :verify_admin

      def new
        @event = Event.new
      end
  
      def create
        @event = Event.new(event_params)
        @event.user = current_user  # Associer l'utilisateur actuel comme créateur
        if @event.save
          redirect_to admin_event_submissions_path, notice: 'Event was successfully created.'
        else
          render :new
        end
      end
  
      def index
        @events = Event.all
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
          redirect_to admin_event_path(@event), notice: 'Event was successfully updated.'
        else
          render :edit
        end
      end
  
      def destroy
        @event = Event.find(params[:id])
        @event.destroy
        redirect_to admin_events_path, notice: 'Event was successfully deleted.'
      end
  
      private
  
      def verify_admin
        redirect_to(root_path) unless current_user.admin?
      end
  
      def event_params
        params.require(:event).permit(:start_date, :duration, :title, :description, :price, :location, :validated, :reviewed)
      end
    end
  end
  