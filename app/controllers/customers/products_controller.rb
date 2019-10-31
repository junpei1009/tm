class Customers::ProductsController < ApplicationController
  def index
    @products = Product.page(params[:page]).reverse_order
    if params[:search].present?
      @products = Product.search(params[:search])
    end
  end

  def show
    @product = Product.find(params[:id])

    if customer_signed_in?
    @cart = current_customer.carts.new
    end

  end



end
