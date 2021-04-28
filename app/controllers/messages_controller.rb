class MessagesController < ApplicationController
    before_action :authenticate_admin!

    def new 
        @message = Message.new
    end
end
