class MoreColumnsToStudents < ActiveRecord::Migration[6.1]
  def change
    add_column :students, :gender, :string
    add_column :students, :dob, :date
    add_column :students, :email, :string
    add_column :students, :phone_number, :string
    add_column :students, :guardian_name, :string
    add_column :students, :guardian_contact, :string
  end
end
