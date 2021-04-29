class Department < ApplicationRecord
    validates :name, presence: true

    has_many :students, class_name: "Student"
    has_many :announcements, class_name: "Announcement", foreign_key: "department_id"
end
