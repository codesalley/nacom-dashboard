class StudentsController < ApplicationController
    respond_to :json
    before_action :authorized


    def index 
        student_inx = params[:index_number]
        student_password = params[:password]
        auth_user(student_inx, student_password)
    end
    def messages 
        render json: {msg: 'student messages'}
        
    end
    def announcements
        render json: {msg: 'student announcements'}
        
    end
    def results 
        render json: {msg: 'student results'}
    end



    def authorized 
        token = request.headers[:token]
        if !token
            head :forbidden
        end
        if !auth(token)
            head :forbidden
        end

    end

    private 

    def auth(t)
        jwt_secret = 'this_is_secret'
       
        return false unless t.present?
        if t
        begin
            decoded = JWT.decode t, jwt_secret, true, {algorithm: 'HS384'}
            return true
        rescue 
            return false
        end
    end

    end


    def auth_user(idx, psw)
        jwt_secret = 'this_is_secret'
        student = Student.find_by(index_number: idx)
        
        if !student || student.password != psw 
            render json: {msg: 'invalid credentials'} 
            return 
        end
        if student.password === psw 
            payload = {
                student: {
                    id: student.id
                }
            }

            token = JWT.encode payload, jwt_secret, 'HS384'
             render json: {token: token}
             return 
        end

    end
end
