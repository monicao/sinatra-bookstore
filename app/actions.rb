# app/actions.rb

get '/admin/products/new' do
  @current_user = User.first
  erb :'products/new'
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
