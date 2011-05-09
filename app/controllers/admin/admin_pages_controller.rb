class Admin::AdminPagesController < ApplicationController

before_filter :authenticate_admin

  def A_Summary
    @title = "Ten Events Summary"
  end

end
