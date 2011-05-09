class Admin::UsersController < AdminController
  
  before_filter :authenticate_admin
  #before_filter :authenticate_public
  
def index
  logger.debug"definitely in the admin controller for users...."
  @users = User.all
  
end
  
  def new
	@user = User.new
	@title = "Create New User"
	
	logger.debug"definitely in the admin controller for new users...."
	
	respond_to do |format|
      format.html { render 'new' }
      format.xml  { render :xml => @user }
	end
  
  end
  
  def show
    @user = User.find(params[:id])
	@title = @user.name
  end
  
  def create
 
 #This is in the public users controller
 
  end
  
  def edit
    
    @user = User.find(params[:id])
    @title = @user.name
    
  end
  
  def update

    #This is in the public users controller
	
  end

def destroy
  
  logger.debug"definitely in the admin controller for destroy users...."
  
  User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to admin_users_path
  
  
end

end