class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :update, :destroy]
  before_action :correct_user_or_owner, only: [:update, :destroy]

  # see all reservations
  def index
    @reservations = current_user.reservations
  end
  #make a reservation
  def new
    @camera = Camera.find(params[:camera_id])
    @reservation = Reservation.new
  end

  def create
    @camera = Camera.find(params[:camera_id])
    @reservation = current_user.reservations.build(reservation_params)
    @reservation.camera = @camera
    @reservation.status = "pending"  # Default status

    if @reservation.save
      redirect_to reservations_path, notice: "Reservation created successfully."
    else
      render :new
    end
  end

  def show
    # The reservation is already set by the before_action
  end

  def update
    if @reservation.user == current_user && @reservation.status == "pending"
      if @reservation.update(reservation_params)
        redirect_to reservation_path(@reservation), notice: "Reservation updated successfully."
      else
        render :show, alert: "Unable to update reservation."
      end
    else
      redirect_to reservations_path, alert: "You can't update this reservation."
    end
  end

  def destroy
    if @reservation.user == current_user || @reservation.camera.user == current_user
      @reservation.destroy
      redirect_to reservations_path, notice: "Reservation canceled successfully."
    else
      redirect_to reservations_path, alert: "You are not authorized to cancel this reservation."
    end
  end
end
