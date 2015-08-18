class UsersController < ApplicationController

	before_filter :authorize_admin, only: [:index, :edit, :update, :new, :create]
	before_filter :authorize, only: [:show]
	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if@user.save
			session[:user_id] = @user.id
			redirect_to root_url
			flash[:info] = "User successfully created!"
		else
			render "new"
		end
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "Post successfully updated!"
      redirect_to root_path
    else
      render 'edit'
    end
	end

    def show
    	if current_user.id == User.find(params[:id]).id || current_user.admin?
    	@user = User.find(params[:id])
    	else
    		flash[:error] = "You are not logged in as this user!"
    		redirect_to root_path
    	end
    end

    def index
    	@users = User.all
    end

    def destroy
    User.delete(params[:id])
      flash[:info] = "Investor successfully removed."
      redirect_to root_path
  	end


	def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name, :total_investment)
    end


end
