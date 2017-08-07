class ReviewsController < ApplicationController
  before_action :authorize

  def create
    @product = Product.find params[:product_id]
    @review = @product.reviews.new(review_params)

     if @review.save
      redirect_to :back, notice: 'Review created!'
    else
      redirect_to :back
    end
  end

  def destroy
    @review = Review.find params[:id]
    @review.destroy
    redirect_to :back , notice: 'Review deleted!'
  end 

  private

  def review_params
    params.require(:review).permit(
      :user_id,
      :product_id,
      :description,
      :rating
    )
  end

  end