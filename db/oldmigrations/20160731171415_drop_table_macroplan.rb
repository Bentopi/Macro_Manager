class DropTableMacroplan < ActiveRecord::Migration[5.0]
  def change
    drop_table :macroplans
  end
end
