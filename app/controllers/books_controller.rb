class BooksController < ApplicationController
	 # before_action :authenticate_user! #deviseのメソッド。ログイン未認証の場合、rootパスへリダイレクトする

	def new
	end

	def create
		@book = Book.new(book_params)
    	@book.user_id = current_user.id
    	if @book.save
    		flash[:notice] = "data create successfully"
    		redirect_to book_path(@book)
    		# redirect_to books_path
    	else
			@user = current_user
	  		@books = Book.all
			render  :index
		end
	end

	def index
		@user = current_user
		@book = Book.new
  		@books = Book.all
	end

	def show
		@user = current_user
		@book = Book.new
		@detail = Book.find(params[:id])
		@books = Book.where(:user_id => @user.id)
	end

	def edit
		@book = Book.find(params[:id])
	end

	def update
		book = Book.find(params[:id])
		if book.update(book_params)
			flash[:notice] = "data update successfully"
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
