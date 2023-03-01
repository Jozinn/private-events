class UsersController < ApplicationController
    before_action :authenticate_user!

    def index_created
        @created_events = User.created_events
    end
end
