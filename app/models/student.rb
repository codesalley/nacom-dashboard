class Student < ApplicationRecord

    belongs_to :admins, class_name: "Admin", foreign_key: 'admin_id'
    has_many :results, class_name: "Result", foreign_key: "student_id"
    has_many :announcements, class_name: "Announcement"
    has_many :messages, class_name: "Message", foreign_key: "student_id"
    has_one :department, class_name: "Department", foreign_key: "student_id"
    has_one_attached :passport 
end
