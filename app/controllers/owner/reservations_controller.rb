class Owner::ReservationsController < ApplicationController
  before_action :authenticate_user!  # Ensures the user is signed in
  before_action :set_reservation, only: [:show, :destroy]
  # before_action :ensure_owner, only: [:update, :destroy]

  # Display all reservations for the owner of the camera
  def index
    @cameras = Camera.includes(:reservations).where(user: current_user)
  end

  # Show a specific reservation
  def show
    @camera = Camera.find(params[:id])
    @reservations = @camera.reservations
  end

  # Update the status of a reservation (e.g., accept or reject)
  # def update
  #   raise
  #   if @reservation = Reservation.find(params[:id])
  #     if @reservation.update(reservation_params)
  #       redirect_to owner_reservations_path, notice: "Reservation updated successfully."
  #     else
  #       render :show, alert: "Unable to update reservation."
  #     end
  #   else
  #     redirect_to owner_reservations_path, alert: "This reservation has already been processed."
  #   end
  # end


  # accept a reservation
  # def accept
  #   if @reservation.camera.user == current_user
  #     @reservation.update(status: "accepted")  # Mark the reservation as accepted
  #     redirect_to owner_reservations_path, notice: "Reservation accepted."
  #   else
  #     redirect_to owner_reservations_path, alert: "You are not authorized to accept this reservation."
  #   end
  # end

  # # reject a reservation
  # def reject
  #   if @reservation.update(status: "rejected")
  #     redirect_to owner_reservation_path(@reservation), notice: "Reservation rejected."
  #   else
  #     redirect_to owner_reservations_path, alert: "Failed to reject reservation."
  #   end
  # end

  # Cancel a reservation
  def destroy
    if @reservation.status == "pending"
      @reservation.destroy
      redirect_to owner_reservations_path, notice: "Reservation canceled."
    else
      redirect_to owner_reservations_path, alert: "This reservation cannot be canceled."
    end
  end

  private

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  # def ensure_owner
  #   unless @reservation.camera.user == current_user
  #     redirect_to owner_reservations_path, alert: "You do not have permission to manage this reservation."
  #   end
  # end

  def reservation_params
    params.require(:reservation).permit(:status)
  end
end
