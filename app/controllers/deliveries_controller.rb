class DeliveriesController < ApplicationController

  def index
    @deliveries = current_customer.deliveries.all
    @delivery = Delivery.new
  end

  def create
    @delivery = Delivery.new(params_delivery)
    @delivery.customer_id = current_customer.id
    @delivery.save
    redirect_to deliveries_path(current_customer)
  end

  def destroy
    @delivery = current_customer.deliveries.find(params[:id])
    @delivery.destroy
    redirect_to deliveries_path(current_customer)
  end

  def edit
    @delivery = current_customer.deliveries.find(params[:id])
  end

  def update
    @delivery = current_customer.deliveries.find(params[:id])
    @delivery.update(params_delivery)
    redirect_to deliveries_path(current_customer)
  end

private
  def params_delivery
    params.require(:delivery).permit(:postal_code, :prefecture, :city, :street_address, :building_name)
  end

end
