class Semister < ApplicationRecord
    validates :name, presence: true

    has_many :results, class_name: "Result", foreign_key: 'semister_id'
end
