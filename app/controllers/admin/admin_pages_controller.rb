class Admin::AdminPagesController < ApplicationController

before_filter :authenticate_public

  def A_Summary
    @title = "Ten Events Summary"
  end

end
