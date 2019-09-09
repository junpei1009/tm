class Customers::CartsController < ApplicationController
  def index
  end

  def destroy
  end

  def update
  end

  def create
    @cart = Cart.new(cart_params)
    @cart.customer_id = current_customer.id
    if Cart.exists?(product_id: @cart.product_id)
      @cart_update = Cart.find_by(product_id: @cart.product_id)
      @cart_update.quantity += @cart.quantity
      @cart_update.save
      redirect_to carts_path(current_customer)
    else
      @cart.save
      redirect_to carts_path(current_customer)
    end
  end

  private
  def cart_params
    params.require(:cart).permit(:product_id, :customer_id, :quantity)
  end

end
