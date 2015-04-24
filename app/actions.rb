# app/actions.rb


# Helpers

# You can use helpers in a block here.
# helpers do
# 
# end

# If you have a lot of helpers, you can keep things organized by
# moving the helpers to a separate file
# You can even break up your helpers in several files if needed

# Require all helpers from /app/helpers.rb
require_relative './helpers'



# Actions

get '/admin/products/new' do
  if current_user
    erb :'products/new'
  else
    "You should be logged in."
  end
end

post '/admin/products' do
  @product = Product.create(name: params[:name], price_in_cents: params[:price_in_cents])
  if @product.persisted?
    redirect '/admin/products'
  else
    erb :'products/new'
  end

end

get '/admin/products' do
  @products = Product.all
  erb :'products/index'
end

get '/admin/products/:id/edit' do
  # params[:id] will be the id extracted from the url
  @product = Product.find(params[:id])
  erb :'products/edit'
end

get '/api/products' do
  @products = Product.all
  @products.to_json
end
