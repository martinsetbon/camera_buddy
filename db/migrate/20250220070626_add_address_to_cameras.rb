class AddAddressToCameras < ActiveRecord::Migration[7.1]
  def change
    add_column :cameras, :address, :string
  end
end
