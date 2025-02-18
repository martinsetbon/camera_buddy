class AddUserToCamera < ActiveRecord::Migration[7.1]
  def change
    add_reference :cameras, :user, foreign_key: true
  end
end
