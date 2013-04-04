class UsersController < ApplicationController
  
  def index
    @users = User.all


    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end
  # GET /users/1
  def show
    @user = User.find(params[:id])
  end
 
  # GET /users/new
  def new    
    @user = User.new
    
    if current_user
      redirect_to( boards_path, :notice => 'Already registered')
    end
  end
 
  # GET /users/1/edit
  def edit
    is_user
  end
 
  # POST /users
  # POST /users.xml
  def create
    @user = User.new(params[:user])
    @user_session = UserSession.new(params[:user])
 
    respond_to do |format|
      if @user.save && @user_session.save
        format.html { redirect_to( boards_path, :notice => 'Registration successfull.') }
      else
        format.html { render :action => "new" }
      end
    end
  end
 
  # PUT /users/1
  def update
    is_user
 
    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to(@user, :notice => 'User was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end
  
  private
  
  def is_user
    if User.exists?(params[:id])
      @user = User.find(params[:id]);
      if !current_user || current_user.id != @user.id
        redirect_to( boards_path, :notice =>"You do not have access to that page")
      end
    else
      redirect_to( boards_path, :notice =>"You do not have access to that page")
    end
  end
 
end