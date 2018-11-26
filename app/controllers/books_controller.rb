class BooksController < ApplicationController
	 before_action :authenticate_user! #deviseのメソッド。ログイン未認証の場合、rootパスへリダイレクトする

	def new
	end

	def create
		user = User.find(params[:user_id])
		book = Book.new(book_params)
    	book.user_id = user.id
    	book.save
    	redirect_to user_path(user)
	end

	def index
		@user = User.find(current_user.id)
		@book = Book.new
  		@books = Book.all
	end

	def show
	end

	private
	def book_params
  		params.require(:book).permit(:user_id,
                      :title,
                      :opinion)
	end
end
