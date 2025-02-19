class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
  end

  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      # redirect_to reservations_path
      redirect_to reservation_path(@reservation)
    else
      # if the reservation doesnt save, we want to show the form again
      # render the form page again aka new.html.erb
      render :new, status: :unprocessable_entity # 422
    end
  end
end
