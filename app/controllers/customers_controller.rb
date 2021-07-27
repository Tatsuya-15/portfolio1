class CustomersController < ApplicationController

  def new
     @customer = Customer.new
     @customer.build_member
  end

  def create
    @customer = Customer.new(customer_params)
    @customer.member_id = current_member.id
    if @customer.save
      redirect_to member_path(current_member)
    else
      render :new
    end
  end

  def index
    @customers = Customer.all

  end

  def show
     @customer = Customer.find(params[:id])
     @lat = @customer.latitude
     @lng = @customer.longitude
     gon.lat = @lat
     gon.lng = @lng
     @post_comment = PostComment.new
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    customer = Customer.find(params[:id])
    customer.update(customer_params)
    redirect_to customer_path(customer)
  end

  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy
    redirect_to customers_path
  end

  private

  def customer_params
    params.require(:customer).permit(:company, :name, :address, :tel, :email, :last_visit_date, :memo, spot_attributes: [:address])
  end

end
