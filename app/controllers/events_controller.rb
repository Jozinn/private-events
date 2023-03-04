class EventsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create]
    
    def index
        @events = Event.all
        @user_signed_in = user_signed_in?
        @current_user = current_user
    end

    def show
        @event = Event.find(params[:id])
    end

    def new
        @user = current_user
        @event = @user.created_events.build
    end

    def create
        @user = current_user
        @event = @user.created_events.build(event_params)
        if @event.save
            redirect_to events_path
        else
            render :new, status: :unprocessable_entity
        end
    end

    private
    def event_params
        params.require(:event).permit(:date, :location, :name, :description)
    end
end
