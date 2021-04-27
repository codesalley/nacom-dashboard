class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.string :title
      t.string :details
      t.string :image

      t.timestamps
    end
  end
end
