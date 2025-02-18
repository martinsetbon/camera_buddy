class Owner::ReservationsController < ApplicationController

  def index
    @reservations = current_user.reservations_as_owner
  end
end
