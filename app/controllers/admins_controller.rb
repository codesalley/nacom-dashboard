class AdminsController <  ApplicationController
    before_action :authenticate_admin!
    def index 
        @student = Student.new
        @departments = Department.all
        @announcements = Announcement.all

    end
    def add_student
        @student = Student.new
        
        newstudent = current_admin.students.build()

        newstudent.save 
       if student.save! 
        render add_student_path, notice: 'student saved'
       else 
        render add_student_path, alert: 'error saving student, check all fields'
       end
      
        
        
        @departments = Department.all.map{ |d| [d.name, d.id] }



    end
    def add_semister
        @semister = Semister.new

    end
    def add_result

        @result = Result.new
        @semister_options = Semister.all.map{ |i| [i.name, i.id]}
        @students_options = Student.all.map{ |i|  ["#{i.first_name} , #{i.middle_name}  #{i.last_name} ", i.id ] }
       
    end

    private 
    def student_params 
        params.require(:Student).permit(:first_name, :middle_name, 
                                :last_name, :index_number, :password, 
                                 :address, :enroll_year, :department_id, :gender, :dob, :email, 
                                 :phone_number, :guardian_name, :guardian_contact)
    end
end
