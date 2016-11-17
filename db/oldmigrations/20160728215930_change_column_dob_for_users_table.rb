class ChangeColumnDobForUsersTable < ActiveRecord::Migration[5.0]
  def change
    change_table :users do |t|
      t.remove :dob
      t.integer :age
    end
  end
end
