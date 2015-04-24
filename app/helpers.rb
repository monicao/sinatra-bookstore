# /app/helpers.rb
helpers do

  # Examples of view helpers

  # Returns a number formatted as currency
  # Ex: $12.99
  def number_to_currency(number)
    "$#{number / 100.0}"
  end
end