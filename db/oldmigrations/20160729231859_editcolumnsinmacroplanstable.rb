class Editcolumnsinmacroplanstable < ActiveRecord::Migration[5.0]
  def change
    change_table :macroplans do |t|
      t.remove :weight_rate, :workout_intensity
      t.float :weight_rate
      t.float :workout_intensity
    end
  end
end
