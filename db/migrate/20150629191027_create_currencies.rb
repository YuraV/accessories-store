class CreateCurrencies < ActiveRecord::Migration
  def change
    create_table :currencies do |t|
      t.string :iso
      t.decimal :rate, :precision => 8, :scale => 2
      t.timestamps
    end
  end
end
