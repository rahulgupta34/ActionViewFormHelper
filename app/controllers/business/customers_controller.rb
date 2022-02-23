class Business::CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end

  def new
    @customer = Customer.new
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
       redirect_to business_customers_path
    else
        render :edit, status: :unprocessable_entity
    end
  end

  def delete_customer
    if params[:customer_id].present?
      @customer = Customer.find(params[:customer_id])
      @customer.destroy
      redirect_to business_customers_path
    else
     render :delete_customer
    end
    
  end

  def search
    if params[:query].present?
      @customer_search = Customer.where("name LIKE '%#{params[:query]}%'")
     end
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      redirect_to business_customers_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def customer_params
    params.require(:customer).permit(:name, :age, :email, :address)
  end
end
