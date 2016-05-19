class ProductsController < ApplicationController

  # View all Products on Index
  def index
    @product = Product.all
  end

  #  Find product by ID when clicked on for show
  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def edit
    @product = Product.find(params[:id])
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to products_url
    else
      render :edit
    end

    def destroy
      @product = Product.find(params[:id])
      @product.destroy
      redirect_to products_url
    end

    private

    def product_params
      params.require(:product).permit(:name, :description, :price_in_centts)
    end
  end


end
