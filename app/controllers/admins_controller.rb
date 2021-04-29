class AdminsController <  ApplicationController
    before_action :authenticate_admin!
    def index 
        @student = Student.new
        @departments = Department.all
        @announcements = Announcement.all
        @semister = Semister.all    
    end
 
    # new student form page controller action
    def new_student 
        @student = Student.new
        @departments = Department.all.map{ |d| [d.name, d.id] }
    end
    # new student add controller action
    def add_student
        @student = Student.new
        department = Department.find_by(id: params[:student][:department_id])
        newstudent = department.students.build(student_params)
        newstudent.save
        if newstudent.save
            redirect_to new_student_path, notice: "Student added sucessfully"
        else
            redirect_to new_student_path, alert: "Fail to add student, check all fields"
        end
    end

        # add results form action
    def new_result
        @result = Result.new
        @departments = Department.all.map{ |d| [d.name, d.id] }
        @semister_options = Semister.all.map{ |i| [i.name, i.id]}
        @students_options = Student.all.map{ |i|  ["#{i.first_name} , #{i.middle_name}  #{i.last_name} ", i.id ] }
    end

    # add student controller action
    def add_result
        newResult = Result.new(result_params)
        newResult.save 
        if newResult.save 
            redirect_to new_results_path, notice: 'Result added'
        else
            redirect_to new_results_path, alert: 'Check all require fields'
        end
        
    end

    # add new semister controller action sent from modal

    def add_semister 
       newSemister  = Semister.new(semister_params)
       newSemister.save 
       if newSemister.save 
        redirect_to root_path, notice: 'Semister added successfully'
       else 
        redirect_to root_path, alert: 'Name is required'
       end

    end

    # add new department controller action from modal 

    def add_department 
       newDepartment = Department.new(name: params[:name])
       newDepartment.save 
       if newDepartment.save 
        redirect_to root_path, notice: 'Department added successfully'
       else 
        redirect_to root_path, alert: 'Name is required'
       end
    end

    
    private 
    def student_params 
        params.require(:student).permit(:first_name, :middle_name, 
            :last_name, :index_number, :password, :department_id,
             :address, :enroll_year, :gender, :dob, :email, 
             :phone_number, :guardian_name, :guardian_contact, :passport) 
    end
    def result_params 
        params.require(:result).permit(:semister_id, :student_id, :basic_nursing, 
                                        :anatomy, :midwifery, :statictis, :another_demo, :last_demo_course)   
    end
    def semister_params 
        params.require(:semister).permit(:name, :date)
    end
end
