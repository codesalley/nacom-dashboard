class Semister < ApplicationRecord
    belongs_to :student, class_name: 'Student', foreign_key: 'admin_id'
    belongs_to :admin, class_name: 'Admin', foreign_key: 'admin_id'
    has_many :results, class_name: "Result", foreign_key: 'semister_id'
end
