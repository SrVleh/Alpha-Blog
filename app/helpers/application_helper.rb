module ApplicationHelper
  def gravatar_for(user, otions = { size: 80 })
    email_address = user.email.downcase
    hash = Digest::MD5.hexdigest(email_address)
    size = otions[:size]
    gravatar_url = "https://www.gravatar.com/avatar/#{ hash }?s=#{ size }"
    image_tag(gravatar_url, alt: user.username, class: "rounded md-auto d-block mt-4 w-25")
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

end
