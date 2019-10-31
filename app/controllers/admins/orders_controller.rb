class Admins::OrdersController < ApplicationController
  before_action :authenticate_admin!
  def index
    @orders = Order.all
  end

  def each_index
  end

  def update
    order = Order.find(params[:id])
    order.update(params_order)
    redirect_to admins_orders_path
  end

  def show
  end

private

  def params_order
    params.require(:order).permit(:payment, :shipping_address, :delivery_status, :subtotal_amount, :total_amount, :postage, :consumption_tax, :customer_id)
  end

end
