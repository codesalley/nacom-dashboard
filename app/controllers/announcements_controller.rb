class AnnouncementsController < ApplicationController
    before_action :authenticate_admin!

    def new 
        @announcement =  Announcement.new 
        @departments = Department.all.map{ |d| [d.name, d.id] }
        @departments << ['All', 'All']
    end
    def create 

    end
end
