class AdminsController <  ApplicationController
    before_action :authenticate_admin!
    def index 
        @student = Student.new
        @departments = Department.all
        @announcements = Announcement.all
        
    end
    
    def new_result
        @result = Result.new 
        @semister_options = Semister.all.map{ |i| [i.name, i.id]}
    end
    def add_result 
    end

    def new_student 
        @student = Student.new
    end
    
    def add_student
        @student = Student.new
        newstudent = current_admin.students.build(student_params)
        newstudent.save
        if newstudent.save
            redirect_to new_student_path, notice: "Student added sucessfully"
        else
            redirect_to new_student_path, alert: "Fail to add student, check all fields"
        end
    end
    
    
    
    
    def add_semister
        @semister = Semister.new
    end

    def new_result
        p params
        @result = Result.new
        @departments = Department.all.map{ |d| [d.name, d.id] }
        @semister_options = Semister.all.map{ |i| [i.name, i.id]}
        @students_options = Student.all.map{ |i|  ["#{i.first_name} , #{i.middle_name}  #{i.last_name} ", i.id ] }
    end


    def add_result
        newResult = Result.new(result_params)
        newResult.save 
        if newResult.save 
            redirect_to new_results_path, notice: 'Result added'
        else
            redirect_to new_results_path, alert: 'Chech all require fields'
        end
        
    end
    
    private 
    def student_params 
        params.require(:student).permit(:first_name, :middle_name, 
            :last_name, :index_number, :password, 
             :address, :enroll_year, :department_id, :gender, :dob, :email, 
             :phone_number, :guardian_name, :guardian_contact) 
    end
    def result_params 
        params.require(:result).permit(:semister_id, :student_id, :basic_nursing, 
                                        :anatomy, :midwifery, :statictis, :another_demo, :last_demo_course)   
    end
end
