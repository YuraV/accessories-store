class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :title
      t.boolean :published, default: true

      t.timestamps
    end
  end
end
