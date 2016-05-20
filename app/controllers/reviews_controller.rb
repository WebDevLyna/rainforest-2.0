class ReviewsController < ApplicationController
  before_action :load_product
  before_action :find_review, only: [:show, :edit, :update, :destroy]

  def show
  end

  def edit
  end

  def update
    if @review.update review_params
      redirect_to @product, notice: "Your review was successfully saved!"
    else
      render 'edit'
    end
  end

  def create
    @review = @product.reviews.build(review_params)
    @review.user = current_user

    # Check out this article on [.build](http://stackoverflow.com/questions/783584/ruby-on-rails-how-do-i-use-the-active-record-build-method-in-a-belongs-to-rel)
    # You could use a longer alternate syntax if it makes more sense to you
    #
    # @review = Review.new(
    #   comment: params[:review][:comment],
    #   product_id: @product.id,
    #   user_id: current_user.id
    # )

    if @review.save
      redirect_to product_review_path(@product, @review), notice: 'Review created successfully!'
    else
      render 'products/show'
    end
  end

  def destroy
    @review.destroy
    redirect_to @product
  end

  private
  def review_params
    params.require(:review).permit(:comment, :product_id)
  end

  def load_product
    @product = Product.find(params[:product_id])
  end

  def find_review
    @review = Review.find(params[:id])
  end

end
