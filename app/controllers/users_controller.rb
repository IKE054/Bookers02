class UsersController < ApplicationController
	 before_action :authenticate_user!, only: [:show, :edit, :update, :index]#deviseのメソッド。ログイン未認証の場合、rootパスへリダイレクトする


  def about
  end

  def show
	@user = User.find(params[:id])
	@users = User.all
	@book = Book.new
	@books = Book.where(:user_id => @user.id)
  end

  def edit
  	@user = User.find(params[:id])
  	if @user.id != current_user.id
	 		redirect_to user_path(current_user.id)
	 	end
  end

  def update
  	@user = User.find(params[:id])
   	if @user.update(user_params)
   		redirect_to user_path(@user.id)
   	else
   		render :edit
   	end
  end

  def top
  end

  def index
  	@user = User.find(current_user.id)
	@book = Book.new
  	@users = User.all
  end

  	private
	def user_params
    	params.require(:user).permit(:name, :image, :introduction)
	end

		#  def authenticate_user!
	 # 	if params[:id] != current_user.id
	 # 		redirect_to user_path(current_user.id)
	 # 	end
	 # end



end
