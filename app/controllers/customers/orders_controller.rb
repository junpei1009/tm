class Customers::OrdersController < ApplicationController
  before_action :correct_customer, {only: [:confirm, :create, :thanks]}
  before_action :authenticate_customer!

  def new
    @order = Order.new
    @carts = current_customer.carts.all
    @price = 0
  end

  def confirm
  end

  def create
    order = Order.new(params_order)
    order.customer_id = current_customer.id
    order.save

    current_customer.carts.each do |cart|
      order_history = OrderHistory.new
      order_history.product_id = cart.product.id
      order_history.order_id = order.id
      order_history.number = cart.quantity
      order_history.price = cart.product.price
      if order_history.save!
        cart.product.stock -= cart.quantity
        cart.product.save
        cart.destroy
      end
    end
    redirect_to order_thanks_path
  end

  def thanks
  end

  def index
    @orders = current_customer.orders.all.order(created_at: :desc)
  end

  def show
  end

private
  def params_order
    params.require(:order).permit(:payment, :shipping_address, :delivery_status, :subtotal_amount, :total_amount, :postage, :consumption_tax, :customer_id)
  end

  def correct_customer(order)
    if current_customer.id != order.customer.id || admin_signed_in?
      redirect_to root_path
    end
  end

end
