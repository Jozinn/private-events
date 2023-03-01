class EventsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create]
    
    def index
        @events = Event.all
    end

    def show
        @event = Event.find(params[:id])
    end

    def new
        @user = current_user
        @event = @user.build_created_event
    end

    def create
        @user = current_user
        @event = @user.build_created_event(event_params)
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
