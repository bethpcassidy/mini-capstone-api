class ProductsController < ApplicationController
  def index
    @products = Product.all
    render template: "products/index"
  end

  def show
    @product = Product.find_by(id: params["id"])
    # render json: product.as_json(methods: [:friendly_created_at, :is_discounted?, :tax])
    render :show
  end

  def create
    @product = Product.new(
      name: params["name"],
      price: params["price"],
      description: params["description"],
    )
    if @product.save
      render json: @product.as_json
    else #errorcheck
      render json: { errors: @product.errors }
    end
  end

  def update
    @product = Product.find_by(id: params["id"])

    @product.name = params["name"] || product.name
    @product.price = params["price"] || product.price
    @product.description = params["description"] || product.description

    if @product.save
      render json: @product.as_json
    else #errorcheck
      render json: { errors: @product.errors }
    end
  end

  def destroy
    product = Product.find_by(id: params["id"])
    product.destroy
    render json: { message: "Product removed" }
  end
end
