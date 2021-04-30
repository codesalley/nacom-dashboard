class StudentsController < ApplicationController
    respond_to :json
    before_action :authorized, except: %i[index]
    skip_before_action :verify_authenticity_token, only: [:index]


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
       data = studentAnnouncement.department.announcements
        render json: data
        
    end
    def results 
        hashed = getUser
        id = hashed[0]['id']
        studentResults = Student.find_by(id: id)
        data = studentResults.results
        render json: data
    end



    def authorized 
        token = request.headers[:token]
        if !token
            render json: {msg: 'Invalid request'}, status: 401
            return
        end
        if !auth(token)
            render json: {msg: 'Invalid request'}, status: 401
            return
        end

    end

    private 
    JWT_TOKEN = 'this_is_secret'
    def getUser 
        decoded = JWT.decode request.headers[:token], JWT_TOKEN, true, {algorithm: 'HS256'}
        return decoded
    end

    def auth(t)
        return false unless t.present?
        if t
        begin
            decoded = JWT.decode t, JWT_TOKEN, true, {algorithm: 'HS256'}
            return true
        rescue 
            return false
        end
    end

    end


    def auth_user(idx, psw)

        student = Student.find_by(index_number: idx)
        if !student || student.password != psw 
            render json: {msg: 'invalid credentials'}, status: 401
            return 
        end
        if student.password === psw 
            expire_time = Time.now.to_i + 2 * 3600
            payload = {         
                id: student.id,
                exp: expire_time
            }

            token = JWT.encode payload, JWT_TOKEN, 'HS256'
             render json: {token: token}
             return 
        end

    end
end
