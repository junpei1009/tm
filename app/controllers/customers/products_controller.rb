class Customers::ProductsController < ApplicationController
  def index
    @products = Product.all
    @cart = current_customer.carts.new
  end

  def show
    @product = Product.find(params[:id])
    @cart = current_customer.carts.new
  end
end
