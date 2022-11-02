class ProductsController < ApplicationController
  def all_products
    products = Product.all
    render json: products
  end

  def cactus
    products = Product.find_by name: "cactus"
    render json: products
  end
end
