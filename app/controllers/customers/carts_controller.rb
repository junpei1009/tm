class Customers::CartsController < ApplicationController
  before_action :correct_customer, {only: [:update, :destroy, :create]}
  before_action :authenticate_customer!

  def index
    @carts = current_customer.carts.all
    p @carts
  end

  def destroy
    cart = Cart.find(params[:id])
    cart.destroy
    redirect_to customer_carts_path(current_customer)
  end

  def update
    cart = Cart.find(params[:id])
    p cart
    cart.update(cart_params)
    redirect_to customer_carts_path(current_customer)
  end

  def create
    cart = Cart.new(cart_params)
    cart.customer_id = current_customer.id
    if Cart.exists?(product_id: cart.product_id)
      @cart_update = Cart.find_by(product_id: cart.product_id)
      @cart_update.quantity += cart.quantity
      @cart_update.save
      redirect_to customer_carts_path(current_customer)
    else
      cart.save
      redirect_to customer_carts_path(current_customer)
    end
  end

  private
  def cart_params
    params.require(:cart).permit(:product_id, :customer_id, :quantity)
  end

  def correct_customer(cart)
    if current_customer.id != cart.customer.id || admin_signed_in?
      redirect_to root_path
    end
  end

end
