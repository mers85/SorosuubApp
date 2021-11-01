class ProductsController < ApplicationController
  before_action :set_product, only: [:edit, :update, :show, :destroy]

  def index
    @products = Product.all.order(updated_at: :desc)
  end

  def new
    @product = Product.new
  end

  def show 
  end

  def create
    @product = Product.new(product_params)

    respond_to do |format|
     if @product.save
       format.html { redirect_to products_path, notice: "Product created" }
     else
       format.html { render :new, status: :unprocessable_entity }
     end
    end
  end

  def edit 
  end

  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to products_path, notice: "Product updated" }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy 
    @product.destroy!
    redirect_to products_path,  notice: "Product deleted"
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price, :stock_quantity)
  end

  def set_product 
    @product = Product.find(params[:id])
  end
end