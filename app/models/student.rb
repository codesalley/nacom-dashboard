class Student < ApplicationRecord
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :dob, presence: true
    validates :email, presence: true
    validates :phone_number, presence: true

    belongs_to :department, class_name: "Department", foreign_key: "student_id"
    has_many :results, class_name: "Result", foreign_key: "student_id"
    has_many :messages, class_name: "Message", foreign_key: "student_id"
    has_many :announcements, through: :department
    
    # has_one_attached :passport, dependent: :destroy

end
