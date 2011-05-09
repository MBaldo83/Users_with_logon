class UsersController < ApplicationController
  
  include SessionsHelper
  
  #THIS IS THE PUBLIC USERS CONTROLLER!!!
  
  before_filter :authenticate_public, :except => [:new, :create]
  
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
    
    logger.debug "in create from public users"
	
	respond_to do |format|
     
     if @user.save
       
       unless signed_in?
        sign_in @user
       end
       
       if admin_user?
         logger.debug"just saved, trying to redirect"
   	     format.html { redirect_to admin_users_path, :flash => { :success => "User created" }}
   	     format.xml  { render :xml => admin_users_path, :status => :created, :location => @user }
       else
	       format.html { redirect_to root_path, :flash => { :success => "Thanks for signing up!" }}
	       format.xml  { render :xml => root_path, :status => :created, :location => @user }
       end
	    
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
	
	    if admin_user?
        flash[:success] = "User updated."
        redirect_to admin_users_path
      else
        flash[:success] = "User updated."
        redirect_to users_path
      end
    else
      @title = @user.name
      render 'edit'
    end
  end

def destroy
  
  logger.debug "in destroy from public users"
  
  User.find(params[:id]).destroy
    
    if admin_user?
      flash[:success] = "User destroyed."
      redirect_to admin_users_path
    else
      flash[:success] = "User destroyed."
      redirect_to users_path
    end
  
end

end
