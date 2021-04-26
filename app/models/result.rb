class Result < ApplicationRecord
    belongs_to :semister, class_name: "Semister", foreign_key: "semister_id"
    belongs_to :student, class_name: "Student", foreign_key: "student_id"
end
