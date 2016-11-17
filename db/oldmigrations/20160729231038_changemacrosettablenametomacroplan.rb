class Changemacrosettablenametomacroplan < ActiveRecord::Migration[5.0]
  def change
    rename_table :macrosets, :macroplans
  end
end
