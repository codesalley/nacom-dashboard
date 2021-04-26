class AddStudentIdToResults < ActiveRecord::Migration[6.1]
  def change
    add_reference :results, :student, foreign_key: true
  end
end
