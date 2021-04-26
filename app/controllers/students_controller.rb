class StudentsController < ApplicationController
    respond_to :json

    def index 

        student_inx = params[:index_number]
        student_password = params[:password]

        auth_user(student_inx, student_password)

    end
    def show 
        
    end

    private 
    def auth_user(idx, psw)
        student = Student.find_by(index_number: idx)
        
        if !student || student.password != psw 
            render json: {msg: 'invalid credentials'} 

        end
        if student.password === psw 
             render json: student

        end

    end
end
