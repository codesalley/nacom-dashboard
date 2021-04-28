class AnnouncementsController < ApplicationController
    before_action :authenticate_admin!

    def new 
        @announcement =  Announcement.new 
        @departments = Department.all.map{ |d| [d.name, d.id] }
        @departments << ['All', -1]
    end
    def create 
        p params
        if params[:department_id].to_i < 0
            p 'all'
        else
            department = Department.find_by(id: params[:department_id])
            if department.present?
        
                department.announcements.build(title: params[:title], content: params[:content])
                 department.save 
                if department.save 
                    redirect_to root_path, notice: 'Announcement sent'
                end
            else
                redirect_to new_announcement_path, alert: 'Error making annoucement'
            end
        end

    end
end
