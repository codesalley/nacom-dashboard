class Announcement < ApplicationRecord
    validates :title, presence: true
    # has_rich_text :content

    belongs_to :department, class_name: "Department", foreign_key: "department_id"
end
