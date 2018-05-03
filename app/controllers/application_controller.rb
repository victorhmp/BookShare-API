class ApplicationController < ActionController::API
  include ActionController::HttpAuthentication::Token::ControllerMethods
  # include ActionController::MimeResponds
  # respond_to :json
end
