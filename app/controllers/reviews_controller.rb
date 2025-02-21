class ReviewsController < ApplicationController
  before_action :set_camera, only: [:create, :destroy]
  # before_action :set_review, only: [:destroy]
  before_action :authenticate_user!


  def create
    @review = @camera.reviews.new(review_params)
    @review.user = current_user

    if @review.save
      redirect_to camera_path(@camera)
    else
      flash[:alert] = "Failed to submit the review. Please try again."
      redirect_to camera_path(@camera)
    end
  end

  def destroy
      @review = Review.find(params[:id])
      @review.destroy
      redirect_to camera_path(@review.camera), status: :see_other
  end

  private

  def set_camera
    @camera = Camera.find(params[:camera_id])
  end

  def review_params
    params.require(:review).permit(:rating, :comment)
  end

  # def set_review
  #   @review = @camera.reviews.find(params[:id])
  # end
end
