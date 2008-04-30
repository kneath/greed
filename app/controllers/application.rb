class Application < Merb::Controller
    
  def authenticate
    user = Merb::Config[:greed][:authentication][:username]
    password = Merb::Config[:greed][:authentication][:password]
    given_user, given_password = Base64.decode64(request.env['HTTP_AUTHORIZATION'].split.last).split(':') rescue [nil, nil]
    unless user == given_user && password == given_password
      headers['WWW-Authenticate'] = %{Basic realm="Idscms/Admin"}
      render("HTTP Basic: Access denied.\n", :status => 401)
      throw :halt
    end
  end
      
end