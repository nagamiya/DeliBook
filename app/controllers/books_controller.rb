class BooksController < ApplicationController
	def index
	  @books = Book.order("id").paginate(page: params[:page], per_page: 5)
	end

	def show
	  @book = Book.find(params[:id])
	  @rental_num = Book.rental_num(@book)
	  @reservation_num = Book.reservation_num(@book)
	  @zaiko = @book.stock_num - @rental_num
	end

	def search 
	  @book_title = params[:book_title]
	  #puts @book_title
	  @book_author = params[:book_author]
	  @book_publisher = params[:book_publisher]
	  @book_genre = params[:book_genre]
	  @book_info = [@book_title, @book_author, @book_publisher, @book_genre]
	  #puts @book_info

	  @books = Book.search(@book_info)
	  render "index"
	end

        def defzaiko(book)
	  book = Book.find_by(id: book.id)
	  rental_num = Book.rental_num(book)
  	  @zaiko = book.stock_num - rental_num
	  return @zaiko
        end
        helper_method :defzaiko
end