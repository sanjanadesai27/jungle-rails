class ReviewsController < ApplicationController

  def create
    @product = Product.find params[:product_id]
    # @user = current_user
    @review = @product.reviews.new(review_params)

     if @review.save
      redirect_to :back, notice: 'Review created!'
    else
      redirect_to :back
    end
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