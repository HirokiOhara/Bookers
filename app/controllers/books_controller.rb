class BooksController < ApplicationController

	def index
		@books = Book.page(params[:page]).per(5).order('created_at DESC')
		@new_book = Book.new
	end

	def show
		@book = Book.find(params[:id])
		@new_book = Book.new
	end

	def create
		@new_book = Book.new(book_params)
		@new_book.user_id = current_user.id
		if @new_book.save
			flash[:success] = "Posted successfully!"
			redirect_to user_path(current_user.id)
		else
			flash[:warning] = "Posted error."
			redirect_to books_path
		end
	end

		private

		def book_params
			params.require(:book).permit(:title, :opinion)
		end

end
