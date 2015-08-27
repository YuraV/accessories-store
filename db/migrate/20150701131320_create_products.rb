class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :currency
      t.text :description
      t.string :title
      t.float :price
      t.file :picture

      t.timestamps
    end
  end
end