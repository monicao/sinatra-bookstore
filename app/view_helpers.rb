helpers do
  # View Helpers
  def number_to_currency(price_in_cents)
    "$#{price_in_cents / 100.0}"
  end
end

