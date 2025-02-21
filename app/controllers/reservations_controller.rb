class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :destroy]
  # before_action :correct_user_or_owner, only: [:update, :destroy]
  before_action :set_camera, only: [:new, :create]

  # See all reservations
  def index
    @reservations = current_user.reservations
  end

  # Make a reservation
  def new
    @reservation = Reservation.new
  end

  def create
    # @reservation = current_user.reservations.build(reservation_params.merge(camera: @camera, status: "pending"))
    @reservation = Reservation.new(reservation_params)
    dates = reservation_params[:start_date].split(' to ')

    @reservation.start_date = Date.parse(dates[0])
    @reservation.end_date = Date.parse(dates[1])
    @reservation.user = current_user
    @reservation.camera = @camera
    @reservation.status = 'pending'

    if @reservation.save
      redirect_to reservations_path, notice: "Reservation created successfully."
    else
      render "cameras/show", status: :unprocessable_entity
    end
  end

  # def update
  #   if @reservation.user == current_user && @reservation.status == "pending" && @reservation.update(reservation_params)
  #     redirect_to @reservation, notice: "Reservation updated successfully."
  #   else
  #     redirect_to reservations_path, alert: "Unable to update reservation."
  #   end
  # end
  def update
    if @reservation = Reservation.find(params[:id])
      if @reservation.update(reservation_params)
        redirect_to owner_reservations_path, notice: "Reservation updated successfully."
      else
        redirect_to owner_reservations_path, alert: "Unable to update reservation."
      end
    else
      redirect_to owner_reservations_path, alert: "This reservation has already been processed."
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

  private

  def set_camera
    @camera = Camera.find(params[:camera_id])
  end

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  def reservation_params
    params.require(:reservation).permit(:status, :start_date, :end_date)
  end
end
