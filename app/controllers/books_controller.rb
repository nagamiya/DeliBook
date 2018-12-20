class BooksController < ApplicationController
	def index
	  @books = Book.order("id")
	end

	def show
	  @book = Book.find(params[:id])
	end

	def new
	end

	def edit
	end

	def create
	end

	def update
	end

	def destroy
	end

	def search 
	  @books = Book.search(params[:book_title])
	  render "index"
	end
end
