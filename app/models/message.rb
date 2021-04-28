class Message < ApplicationRecord
    validates :title, presence: true


    belongs_to :student, class_name: "Student", foreign_key: "student_id"

    has_rich_text :content
end
