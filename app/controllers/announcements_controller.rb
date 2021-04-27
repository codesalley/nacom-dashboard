class AnnouncementsController < ApplicationController
    before_action :authenticate_admin!
end
