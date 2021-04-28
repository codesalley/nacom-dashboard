class StudentsController < ApplicationController
    respond_to :json
    before_action :authorized, except: %i[index]


    def index 
        student_inx = params[:index_number]
        student_password = params[:password]
        auth_user(student_inx, student_password)
    end
    def messages 
        hashed = getUser
        id = hashed[0]['id']
        studentMessages = Student.find_by(id: id)
        data = studentMessages.messages
        render json: data
        
    end
    def announcements
        hashed = getUser
       id = hashed[0]['id']
       studentAnnouncement = Student.find_by(id: id)
       data = studentAnnouncement.department
        render json: data
        
    end
    def results 
        render json: {msg: 'student results'}
    end



    def authorized 
        token = request.headers[:token]
        if !token
            render json: {msg: 'Invalid request'}
            return
        end
        if !auth(token)
            render json: {msg: 'Invalid request'}
            return
        end

    end

    private 
    JWT_TOKEN = 'this_is_secret'
    def getUser 
        decoded = JWT.decode request.headers[:token], JWT_TOKEN, true, {algorithm: 'HS384'}
        return decoded
    end

    def auth(t)
 
       
        return false unless t.present?
        if t
        begin
            decoded = JWT.decode t, JWT_TOKEN, true, {algorithm: 'HS384'}
            return true
        rescue 
            return false
        end
    end

    end


    def auth_user(idx, psw)

        student = Student.find_by(index_number: idx)
        
        if !student || student.password != psw 
            render json: {msg: 'invalid credentials'} 
            return 
        end
        if student.password === psw 
            payload = {
              
                    id: student.id
       
            }

            token = JWT.encode payload, JWT_TOKEN, 'HS384'
             render json: {token: token}
             return 
        end

    end
end
