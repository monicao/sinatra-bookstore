# app/actions.rb

helpers do
  def number_to_currency(number, symbol)
    "#{symbol}#{number / 100.0}"
  end
end

get '/admin/products/new' do
  erb :'products/new'
end

# /admin/products/12/edit
get '/admin/products/:id/edit' do
  @product = Product.find(params[:id])
  erb :'products/edit'
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

# Fake login action. Used for demo purposes.
# It doesn't really check the email and password, just logs in the user with id=1
# Also it does not follow the REST standard. Should be POST instead of GET.
get '/login' do
  session[:user_id] = 1
end
