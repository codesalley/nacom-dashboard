class StudentMailer < ApplicationMailer
    def welcome_mail 
        @student = params[:email]
        mail(to: @student, subject: "Welcome To Nacom")
    end
end
