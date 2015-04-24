# /app/helpers.rb
helpers do

  # Examples of view helpers

  # Returns a number formatted as currency
  # Ex: $12.99
  def number_to_currency(number)
    "$#{number / 100.0}"
  end

  def button_primary(label, path)
    '<a class="btn btn-primary" href="' + path +' ">' + label + '</a>'
  end


  # Example of action helper

  # Returns the currently logged in user
  # Returns nil if the user is not logged in (user will not be logged in 20% of the time)
  def current_user
    
    # Normally we would look in the session to see if there is a user_id 
    # to figure out if the user is loggged in.
    # For demo purposes this app randomly picks if the user is logged in
    if rand(100) > 20 
      User.last
    else
      nil
    end
  end

end