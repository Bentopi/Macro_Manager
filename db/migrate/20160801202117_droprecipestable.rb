class Droprecipestable < ActiveRecord::Migration[5.0]
  def change
    drop_table :recipes
  end
end
