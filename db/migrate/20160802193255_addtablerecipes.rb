class Addtablerecipes < ActiveRecord::Migration[5.0]
  def change
    create_table :recipes do |t|
      t.string :category
      t.string :name

      t.timestamps
    end
  end
end
