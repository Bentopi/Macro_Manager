class MakeNotchDefaultto1 < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :notch, :integer, default: 1
  end
end
