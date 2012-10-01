class CreateComplaints < ActiveRecord::Migration
  def change
    create_table :complaints do |t|
      t.text :complaint_text
      t.integer :ward_id

      t.timestamps
    end
  end
end
