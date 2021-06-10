class CustomersController < ApplicationController
  
  def new
     @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    @customer.member_id = current_member.id
    @customer.save
    redirect_to customers_path
  end

  def index
    @customers = Customer.all
  end

  def show
  end
  
  def edit
  end

  def destroy
  end
  
  private

  def customer_params
    params.permit(:company, :name, :address, :tel, :email, :last_visit_date, :memo)
  end
  
end
