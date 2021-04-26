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
        jwt_secret = 'this_is_secret'
        student = Student.find_by(index_number: idx)
        
        if !student || student.password != psw 
            render json: {msg: 'invalid credentials'} 
        end
        if student.password === psw 
            payload = {
                student: {
                    id: student.id
                }
            }

            token = JWT.encode payload, jwt_secret, 'HS384'
            
            decoded = JWT.decode token, jwt_secret, true, {algorithm: 'HS384'}

            p decoded[0]

             render json: {token: token}
        end

    end
end
