class AdminController < ApplicationController

  protect_from_forgery
  include SessionsHelper

before_filter :authenticate_admin

def authenticate_admin
  deny_access unless signed_in? and admin_user?
end

def index
  
end

end