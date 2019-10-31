class CustomersController < ApplicationController
  before_action :correct_customer, {only: [:update, :destroy]}
  before_action :authenticate_customer!

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    customer = Customer.find(params[:id])
    if customer.update(params_customer)
      redirect_to customer_path(current_customer)
    else
      render 'edit'
    end
  end

  def acount
  end

  def destroy
    customer = Customer.find(params[:id])
    customer.destroy
    redirect_to root_path
  end

private
  def params_customer
    params.require(:customer).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :tell, :birthday, :customer_postal_code, :customer_prefecture, :customer_city, :customer_street_address, :customer_building_name)
  end

  def correct_customer(customer)
    if current_customer.id != customer.id || admin_signed_in?
      redirect_to root_path
    end
  end

end
