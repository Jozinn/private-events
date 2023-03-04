class AttendenceController < ApplicationController
    before_action :authenticate_user!

    def attend
        @user = current_user
        @event = params[:event]

        @user.attended_events << @event
        redirect_to root_path
    end
end
