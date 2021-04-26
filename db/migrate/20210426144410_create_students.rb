class CreateStudents < ActiveRecord::Migration[6.1]
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :index_number
      t.string :password
      t.string :address
      t.string :course
      t.date :enroll_year

      t.timestamps
    end
  end
end
