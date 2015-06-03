class AddScore < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.integer :annual_kwh, null: false
    end
  end
end
