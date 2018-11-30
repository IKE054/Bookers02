class BooksController < ApplicationController
		 before_action :authenticate_user!

	def new
	end

	def create
		@book = Book.new(book_params)
    	@book.user_id = current_user.id
    	if @book.save
    		flash[:notice] = "Book was successfully created."
    		redirect_to book_path(@book)
    		# redirect_to books_path
    	else
			@user = current_user
			@users = User.all
	  		@books = Book.all
			render  :index
		end
	end

	def index
		@user = current_user
		@users = User.all
		@book = Book.new
  		@books = Book.all
	end

	def show
		@book = Book.new
		@detail = Book.find(params[:id])
		@user = User.find_by(id: @detail.user_id)
		@books = Book.where(:user_id => @user.id)
	end

	def edit
		@book = Book.find(params[:id])
		 if @book.user_id != current_user.id
	 		redirect_to books_path
	 	end
	end

	def update
		@book = Book.find(params[:id])
		if @book.update(book_params)
			flash[:notice] = "Book was successfully updated."
			redirect_to book_path(@book.id)
		else
			render :edit
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
