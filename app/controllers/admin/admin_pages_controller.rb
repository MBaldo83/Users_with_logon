class Admin::AdminPagesController < AdminController

before_filter :authenticate_admin
#before_filter :authenticate_public

  def A_Summary
    @title = "Ten Events Summary"
  end

end
