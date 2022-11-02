class ProductsController < ApplicationController
  def all_products
    products = Product.all
    render json: products
  end
end
