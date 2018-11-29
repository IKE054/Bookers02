class UsersController < ApplicationController
	 before_action :authenticate_user!, only: [:show, :edit]#deviseのメソッド。ログイン未認証の場合、rootパスへリダイレクトする

  def about
  end

  def show
	@user = User.find(params[:id])
	@book = Book.new
	@books = Book.where(:user_id => @user.id)
  end

  def edit
  	@user = User.find(params[:id])

  end

  def update
  	@user = User.find(params[:id])
   	@user.update(user_params)
   	redirect_to user_path(@user.id)
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


end
