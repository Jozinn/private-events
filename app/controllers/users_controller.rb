class UsersController < ApplicationController
    before_action :authenticate_user!

    def show
        @created_events = User.created_events
        @attended_events = User.attended_events
    end
end
