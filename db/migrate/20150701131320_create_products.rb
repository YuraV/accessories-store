class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :currency
      t.text :description
      t.string :title
      t.float :price
      t.integer :category_id
      t.timestamps
    end

    add_index :products, :category_id
  end
end
