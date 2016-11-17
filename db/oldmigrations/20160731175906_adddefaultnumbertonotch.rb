class Adddefaultnumbertonotch < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :notch, :integer, default: 0
  end
end
