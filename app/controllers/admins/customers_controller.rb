class Admins::CustomersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @customer = Customer.all
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
