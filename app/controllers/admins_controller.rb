class AdminsController <  ApplicationController
    before_action :authenticate_admin!
    def index 
        @student = Student.new
        @departments = Department.all
        @announcements = Announcement.all

    end
    def add_student
        @student = Student.new
        @departments = Department.all.map{ |d| [d.name, d.id] }
    end
    def add_semister
        @semister = Semister.new

    end
    def add_result
        p params
        @result = Result.new
        @semister_options = Semister.all.map{ |i| [i.name, i.id]}
        @students_options = Student.all.map{ |i|  ["#{i.first_name} , #{i.middle_name}  #{i.last_name} ", i.id ] }
       
    end
end
