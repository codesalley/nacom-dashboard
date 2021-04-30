class Announcement < ApplicationRecord
    validates :title, presence: true


    belongs_to :department, class_name: "Department", foreign_key: "department_id"
end
