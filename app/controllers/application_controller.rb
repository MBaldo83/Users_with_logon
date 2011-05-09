class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper
  
  	def authenticate_public
      deny_access unless signed_in?
    end

end
