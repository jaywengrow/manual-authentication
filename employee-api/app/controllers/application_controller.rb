class ApplicationController < ActionController::API
  include ActionController::MimeResponds
  include ActionController::ImplicitRender
  include ActionController::HttpAuthentication::Token::ControllerMethods
  respond_to :xml, :json

  before_filter :restrict_access

  def restrict_access
    authenticate_or_request_with_http_token do |token, options|
      api_key = ApiKey.find_by(access_token: token) 
      user = api_key && User.find_by(id: api_key.user_id)
      user && user.email == request.headers["X-User-Email"]
    end
  end


end
