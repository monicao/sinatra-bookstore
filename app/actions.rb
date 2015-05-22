# app/actions.rb
require_relative './view_helpers'
require_relative './action_helpers'


get '/admin/products/new' do
  if current_user
    erb :'products/new'
  else
    redirect '/'
  end
end

post '/admin/products' do
  @product = Product.create(name: params[:name], price_in_cents: params[:price_in_cents])
  if @product.persisted?
    redirect '/admin/products'  # HTTP response: status: 301, body: "/admin/products"
  else
    # validations failed
    @product.errors
    erb :'products/new'  # HTTP response: status: 200, body: "<html>..."
  end

end

get '/admin/products' do
  @products = Product.all
  erb :'products/index'
end

get '/' do
  erb :'home/index', layout: :home
end

# Fake login action. Used for demo purposes.
# It doesn't really check the email and password, just logs in the user with id=1
# Also it does not follow the REST standard. Should be POST instead of GET.
get '/login' do
  session[:user_id] = 1
  redirect '/'
end

get '/logout' do
  session.clear
  redirect '/'
end

# API

get '/api/products' do
  content_type :json # tell the browser we are returning json data
  @products = Product.all
  @products.to_json
end
