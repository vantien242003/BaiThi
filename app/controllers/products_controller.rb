class ProductsController < ApplicationController
  allow_unauthenticated_access only: %i[ index show ]
  before_action :set_product, only: %i[ show edit update destroy ]
# hien thi
  def index
    @products = Product.all
  end
# show id
  def show
    @product = Product.find(params[:id])
  end
# tao san pham moi
  def new
    @product = Product.new
  end
# else
  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to @product
    else
      render :new, status: :unprocessable_entity
    end
  end

  # sua san pham
  def edit
    @product = Product.find(params[:id])
  end

# cap nhat san pham
  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to @product
    else
      render :edit, status: :unprocessable_entity
    end
  end

# xoa san pham
  def destroy
    @product.destroy
    redirect_to products_path
  end

  private
    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.expect(product: [ :name, :description, :featured_image ])
    end

end