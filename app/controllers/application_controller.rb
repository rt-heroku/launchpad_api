class ApplicationController < ActionController::API
  include ActionController::HttpAuthentication::Basic::ControllerMethods
  
  before_action :authenticate

  private

  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == 'launchpad' && password == ENV['LAUNCHPAD_LICENSE_KEY']
    end
  end  
end
