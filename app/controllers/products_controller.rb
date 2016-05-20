class ProductsController < ApplicationController
  before_action :find_product, only: [:show, :edit, :update, :destroy]

  # View all Products on Index
  def index
    @products = Product.all
  end

  #  Find product by ID when clicked on for show
  def show
    @product = Product.find(params[:id])

    if current_user
      @review = @product.reviews.build
    end
  end

  def new
    @product = Product.new
  end

  def edit
  end

  def update
    if @product.update_attributes(product_params)
      redirect_to product_path
    else
      render :edit
    end
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to products_path
    else
      render :new
    end
  end

  def destroy
    @product.destroy
    redirect_to products_path
  end

  private
  def product_params
    params.require(:product).permit(:name, :description, :price_in_cents)
  end

  def find_product
    @product = Product.find(params[:id])
  end

end
