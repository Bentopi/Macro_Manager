class AddColumnMacroplansTable < ActiveRecord::Migration[5.0]
  def change
    change_table :macroplans do |t|
      t.integer :weight_rate
    end
  end
end
