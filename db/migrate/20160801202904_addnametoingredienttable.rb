class Addnametoingredienttable < ActiveRecord::Migration[5.0]
  def change
    change_table :ingredients do |t|
      t.string  :name
    end
  end
end
