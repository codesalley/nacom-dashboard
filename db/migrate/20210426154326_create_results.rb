class CreateResults < ActiveRecord::Migration[6.1]
  def change
    create_table :results do |t|
      t.string :course_name
      t.date :date

      t.timestamps
    end
  end
end
