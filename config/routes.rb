Rails.application.routes.draw do
  get "/store", controller: "products", action: "all_products"
end
