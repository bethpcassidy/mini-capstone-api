class OrdersController < ApplicationController
  before_action :authenticate_user

  def index
    if current_user
      order = Order.all
    else
      render json: [], status: unauthorized
    end
  end

  #honk

  def create
    product = Product.find_by(id: params[:product_id])

    calculated_subtotal = product.price * params[:quantity].to_i
    calculated_tax = calculated_subtotal * 0.09
    calculated_total = calculated_tax + calculated_subtotal

    order = Order.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      subtotal: calculated_subtotal,
      tax: calculated_tax,
      total: calculated_total,
    )
    # if product.save
    #   render
    # else
    #   error
    # end
    order.save
  end

  def show
    if current_user
      @order = Order.find_by(user_id: params["user_id"])
      # render json: product.as_json(methods: [:friendly_created_at, :is_discounted?, :tax])
      render :show
    else
      render json: [], status: unauthorized
    end
  end
end
