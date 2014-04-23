class UsersController < ApplicationController
	before_action :set_user, only: [:show, :edit, :update, :destroy]
    
  #def new
  #end #original controller
  def index
      @users = User.order(:name)
      
      respond_to do |format|
          format.html # index.html.erb
          format.xml { render :xml => @users }
      end
  end

  def show

  end

  def new
  	@user = User.new
  	if @user.save
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
      sign_in @user
  		redirect_to @user, :notice => "Successfully signed up."
  	else
  		render "new"
  	end
  end

  def destroy
      if session[:user_id] != @user[:id]
          flash[:notice] = "Sorry you can not"
          redirect_to "/users"
      else
  	@user.destroy
    redirect_to "/users"
      end
  end

  def update
  	respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  	def set_user
      begin
        @user = User.find(params[:id])
        rescue ActiveRecord::RecordNotFound
          redirect_to "/users"
      end 
    end
  	def user_params
  		params.require(:user).permit(:name, :email, :password, :password_confirmation)
  	end	
end
