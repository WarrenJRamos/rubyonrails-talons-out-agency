class Auth0Controller < ApplicationController
  def callback
    # This stores all the user information that came from Auth0
    # and the IdP
    session[:userinfo] = request.env['omniauth.auth']

    # Redirect to the URL you want after successful auth
    redirect_to "/firms"
  end

  def failure
    # show a failure page or redirect to an error page
    @error_msg = request.params['message']
    redirect_to root_path
  end
end