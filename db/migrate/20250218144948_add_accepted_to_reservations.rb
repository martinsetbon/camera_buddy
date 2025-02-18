class AddAcceptedToReservations < ActiveRecord::Migration[7.1]
  def change
    add_column :reservations, :accepted, :boolean, default: false
  end
end
