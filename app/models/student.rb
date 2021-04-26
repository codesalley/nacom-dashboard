class Student < ApplicationRecord
    belongs_to :admins, class_name: "Admin", foreign_key: 'admin_id'
    has_many :results, class_name: "Result", foreign_key: "student_id"

    has_one_attached :passport 
end
