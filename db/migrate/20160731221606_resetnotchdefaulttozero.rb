class Resetnotchdefaulttozero < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :notch, :float, default: 0
  end
end
