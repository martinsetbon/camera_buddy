class CreateCameras < ActiveRecord::Migration[7.1]
  def change
    create_table :cameras do |t|
      t.string :brand
      t.string :model
      t.text :description
      t.decimal :price

      t.timestamps
    end
  end
end
