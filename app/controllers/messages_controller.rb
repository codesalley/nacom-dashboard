class MessagesController < ApplicationController
    before_action :authenticate_admin!

    def index

    end

    def new 
        @message = Message.new
    end
    
    def create 
        student = Student.find_by(index_number: params[:index_number])
        if student.present?
           studentMsg = student.messages.build(title: params[:title], content: params[:content])
          if studentMsg.save
            redirect_to root_path, notice: 'Message Sent '

          end
        else

            redirect_to root_path, alert: 'Error sending message'
        end
 
  
    end
end
