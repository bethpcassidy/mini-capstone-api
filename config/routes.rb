Rails.application.routes.draw do
  get "/store", controller: "products", action: "all_products"
  get "/cactus", controller: "products", action: "cactus"
end
