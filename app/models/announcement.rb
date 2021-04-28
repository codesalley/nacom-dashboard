class Announcement < ApplicationRecord

    has_rich_text :content

    belongs_to :student, class_name: "Student", foreign_key: "student_id"
end
