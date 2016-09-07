class WeightRateToString < ActiveRecord::Migration[5.0]
  def change
    change_table :users do |t|
      t.remove :weight_rate
      t.string  :weight_rate
    end
  end
end
