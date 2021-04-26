class AdminsController <  ApplicationController
    before_action :authenticate_admin!
    def index 
        @student = Student.new

    end
    def add_student
        @student = Student.new
        byebug

    end
end
