# app/actions.rb
helpers do
  def number_to_currency(price_in_cents)
    "$#{price_in_cents / 100.0}"
  end
end

get '/products' do
  @products = Product.all
  erb :'front/products/index', layout: :front_layout
end

get '/admin/products/new' do
  erb :'admin/products/new', layout: :'admin_layout'
end

post '/admin/products' do
  @product = Product.create(name: params[:name], price_in_cents: params[:price_in_cents])
  if @product.persisted?
    redirect '/admin/products'
  else
    erb :'admin/products/new', layout: :'admin_layout'
  end

end

get '/admin/products' do
  @message = "This is a message"
  @products = Product.all
  erb :'admin/products/index', layout: :'admin_layout'
end

# JSON API endpoint
get '/api/products' do
  @products = Product.all
  products_json = @products.to_json
  body products_json
end

# Fake login action. Used for demo purposes.
# It doesn't really check the email and password, just logs in the user with id=1
# Also it does not follow the REST standard. Should be POST instead of GET.
get '/login' do
  session[:user_id] = 1
end
