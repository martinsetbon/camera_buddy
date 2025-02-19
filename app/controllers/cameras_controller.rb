class CamerasController < ApplicationController
  # '/cameras'
  def index
    @cameras = Camera.all
  end

  # '/cameras/1'
  def show
    # Rails pulls the id from the URL and puts in the params
    @camera = Camera.find(params[:id])
    @reservation = Reservation.new(camera: @camera)
  end

  # '/cameras/new'
  def new
    # this is for the form builder (with will build the path + method)
    @camera = Camera.new
  end

  # we can only trigger this action, by submitting a form
  # it's only purpose is to create, so it doesnt have a view
  def create
    @camera = Camera.new(camera_params)
    if @camera.save
      # redirect_to cameras_path
      redirect_to camera_path(@camera)
    else
      # if the camera doesnt save, we want to show the form again
      # render the form page again aka new.html.erb
      render :new, status: :unprocessable_entity # 422
    end
  end

  # '/cameras/20/edit'
  def edit
    # this is just for the form
    @camera = Camera.find(params[:id])
  end

  # we can only trigger this action, by submitting a form
  # it's only purpose is to update, so it doesnt have a view
  def update
    # load the camera using the id from the URL (not the form)
    @camera = Camera.find(params[:id])
    # update the instance using the data from the form
    if @camera.update(camera_params)
      redirect_to camera_path(@camera)
    else
      # if the camera doesnt save, we want to show the form again
      # render the form page again aka new.html.erb
      render :edit, status: :unprocessable_entity # 422
    end
  end

  def destroy
    @camera = Camera.find(params[:id])
    @camera.destroy
    redirect_to cameras_path, status: :see_other
  end

  private

  def camera_params
    # for security reasons, we are whitelisting our params
    params.require(:camera).permit(:brand, :model, :description, :price)
  end
end
