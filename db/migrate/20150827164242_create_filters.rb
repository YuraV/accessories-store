class CreateFilters < ActiveRecord::Migration
  def change
    create_table :filters do |t|
      t.string :title
      t.boolean :published, default: true
      t.integer :category_id

      t.timestamps
    end
  end
end
