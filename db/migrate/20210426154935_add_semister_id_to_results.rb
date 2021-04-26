class AddSemisterIdToResults < ActiveRecord::Migration[6.1]
  def change
    add_reference :results, :semister, foreign_key: true
  end
end
