class AddUserAndCameraToReservation < ActiveRecord::Migration[7.1]
  def change
    add_reference :reservations, :user, foreign_key: true
    add_reference :reservations, :camera, foreign_key: true
  end
end
