# Define action helpers and view helpers here
helpers do
  # Return the current user or nil if not logged in
  def current_user
    if session[:user_id]
      @current_user = User.find(session[:user_id])
    end
    @current_user
  end
end
