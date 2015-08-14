# app/actions.rb
helpers do
  def cents_to_dollars(cents)
    cents / 100.0
  end

  def current_user
    @current_user = User.find(session[:user_id]) if session[:user_id]
  end

  def require_user
    if !current_user
      redirect '/'
    end
  end
end

get '/' do
  erb :'home'
end

get '/admin/products/new' do
  require_user
  erb :'products/new', layout: :admin
end

post '/admin/products' do
  require_user
  @product = Product.create(name: params[:name], price_in_cents: params[:price_in_cents])
  if @product.persisted?
    flash[:message] = "Product #{@product.name} created successfully."
    redirect '/admin/products'
  else
    erb :'products/new', layout: :admin
  end

end

get '/admin/products' do
  require_user
  @products = Product.all
  erb :'products/index', layout: :admin
end

get '/products' do
  @products = Product.all
  @products.to_json
end

# Fake login action. Used for demo purposes.
# It doesn't really check the email and password, just logs in the user with id=1
# Also it does not follow the REST standard. Should be POST instead of GET.
get '/login' do
  session[:user_id] = User.first.id
  redirect '/'
end
