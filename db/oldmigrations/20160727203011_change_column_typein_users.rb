class ChangeColumnTypeinUsers < ActiveRecord::Migration[5.0]
  change_table :users do |t|
    t.remove :height, :weight, :dob
    t.integer :height
    t.integer :weight
    t.date :dob
  end
end
