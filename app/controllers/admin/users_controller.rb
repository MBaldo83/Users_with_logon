class UsersController < AdminController
  
  before_filter :authenticate_public, :except => ###
  
def index
  
  @users = User.all
  
end
  
  def new
	@user = User.new
	@title = "Create New User"
	
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
    @user = User.new(params[:user])
	
	respond_to do |format|
     
     if @user.save
	   format.html { redirect_to users_path, :flash => { :success => "User created" }}
	   format.xml  { render :xml => users_path, :status => :created, :location => @user }
	   
     else
      @title = "Sign up"
	  format.html { render 'new' }
	  format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
     end
	end
  end
  
  def edit
    
    @user = User.find(params[:id])
    @title = @user.name
    
  end
  
  def update
    @user = User.find(params[:id])
	
    if @user.update_attributes(params[:user])
	
      flash[:success] = "User updated."
      redirect_to users_path
    else
      @title = @user.name
      render 'edit'
    end
	
  end

def destroy
  
  User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_path
  
  
end

end