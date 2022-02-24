class OrdersController < ApplicationController
  before_action :order_find, only: [:edit, :show, :destroy, :update]
  def index
    @orders = Order.all
  end

  def create
    @product = Product.find(params[:product_id])
    @order = @product.orders.create(order_params)
    redirect_to orders_path
  end

  def edit
  end
  
  def update
    if @order.update(order_params)
        redirect_to orders_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @order.destroy
    redirect_to orders_path
  end

  def show
  end

  def order_find
    @order = Order.find(params[:id])
  end
  
  private
  def order_params
    params.require(:order).permit(:quantity, :total_price, :status)
  end
end
