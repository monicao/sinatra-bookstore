Sinatra Bookstore
=============

Based off the Lighthouse Sinatra Skeleton. Live coding app to demo advanced sinatra features.

We are building an application for a company that sells books online. We are starting out with building the admin panel.


## Topics

- generating dummy data
  - ex: I want to be able to generate products and users quickly (not manually)
  - how to run rake tasks on heroku
- tux
  - ex: I want to see all the products in my database
  - ex: I want to test out a model feature without using the UI. (create product validations)
  - remember to reload if code changes
- assets and public folder
  - ex: i want to use the bootstrap css framework with my app
- layout
  - ex: i want to add a nav bar to the products index page
  - ex: i want to create a home page (no nav bar), different layout
- rendering json
  - ex: I want to get a list of all products in JSON format for my API
- view helpers
  - ex: number_to_currency
- action helpers
  - ex: current_user
- partials
  - ex: I want to create an edit product page and reuse the form fields from the new product page
- flash messages
  - ex: After I create a product, I want to see a message that tells me the product was created successfully.

```
  <div class="form-group">
    <label for="name">Name</label>
    <input type="name" class="form-control" name="name" placeholder="Enter name" value="<%= @product.name if @product%>">
  </div>
  <div class="form-group">
    <label>Price in cents</label>
    <input type="text" class="form-control" name="price_in_cents" placeholder="Price in cents" value="<%= @product.price_in_cents  if @product%>">
  </div>
  <button type="submit" class="btn btn-default">Submit</button>
```

