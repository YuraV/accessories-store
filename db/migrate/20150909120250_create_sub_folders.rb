class CreateSubFolders < ActiveRecord::Migration
  def change
    create_table :sub_folders do |t|
      t.string :title
      t.integer :category_id
      t.boolean :published, default: true

      t.timestamps
    end
  end
end
