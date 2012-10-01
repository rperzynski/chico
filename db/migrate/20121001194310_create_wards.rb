class CreateWards < ActiveRecord::Migration
  def change
    create_table :wards do |t|
      t.string :ward_num

      t.timestamps
    end
  end
end
