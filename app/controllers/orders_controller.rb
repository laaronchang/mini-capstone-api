class OrdersController < ApplicationController

  def index
    @orders = Order.all
    render template: "orders/index"
  end

  def show
    @order = Order.find_by(id: params[:id])
    render template:"orders/show"
  end

  def create
    @order = Order.new(
      user_id: params[:user_id],
      subtotal: params[:subtotal],
      tax: params[:tax],
      total: params[:total]
    )
    if @order.save
      render template: "orders/show"
    else
      # below shows message of your choosing
      # render json: {message: "This is not the way"}
      render json: {errors: @order.errors.full_messages}
    end
  end
end
