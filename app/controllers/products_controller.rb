class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  respond_to :js

  # GET /products
  # GET /products.json

  # GET /products/1
  # GET /products/1.json
  def show
<<<<<<< HEAD
=======
    format.js
>>>>>>> ac0507053eeb1e661b5749a3f9adb640a0a53fe8
  end

  # GET /products/new
  def new
    @product = Product.new(category_id: params[:category_id])
  end

  # GET /products/1/edit
  def edit

  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    if @product.save
      render :reload_category
    else
      render :new
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    @product.update_attributes(product_params)

    if @product.save
      render :reload_category
    else
      render :edit
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    render :reload_category
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :category_id, :description, :image, :amount, :price)
    end
end
