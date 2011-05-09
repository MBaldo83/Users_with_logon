class AdminController < ApplicationController

  protect_from_forgery
  include SessionsHelper

  before_filter :authenticate_admin
  #before_filter :authenticate_public
  
#&& admin_user?
def authenticate_admin
   if signed_in?
     if admin_user?
     logger.debug"signed in, and admin user yeah"
     return
     else 
       logger.debug"denying access for admin authenticate no"
       deny_access_not_admin
     end
   else
     deny_access
  end
end

def index
  
end

end