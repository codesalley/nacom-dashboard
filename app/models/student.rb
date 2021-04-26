class Student < ApplicationRecord
    belongs_to :admins, class_name: "Admin"
end
