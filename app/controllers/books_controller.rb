class BooksController < ApplicationController
	 # before_action :authenticate_user! #deviseのメソッド。ログイン未認証の場合、rootパスへリダイレクトする

	def new
	end

	def create
		user = User.find(params[:user_id])
		book = Book.new(book_params)
    	book.user_id = user.id
    	book.save
    	redirect_to "/users/#{user.id}/books/#{book.id}/"
	end

	def index
		@user = User.find(current_user.id)
		@book = Book.new
  		@books = Book.all
	end

	def show
		@user = User.find(params[:user_id])
		@new = Book.new
		@book = Book.find(params[:id])
		@books = Book.where(:user_id => @user.id)
	end

	def edit
		@book = Book.find(params[:id])
	end

	def update
		book = Book.find(params[:id])
		if book.update(book_params)
			flash[:notice] = "successfully"
			redirect_to book_path(book.id)
		else
			redirect_to book_path(book.id)
		end
	end

	def destroy
		book = Book.find(params[:id])
		book.destroy
		redirect_to books_path
	end

	private
	def book_params
  		params.require(:book).permit(:user_id,
                      :title,
                      :opinion)
	end
end
