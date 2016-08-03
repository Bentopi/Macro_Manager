class Changeweightandnotchtofloat < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :notch, :float, default: 1
    change_column :users, :weight, :float
  end
end
