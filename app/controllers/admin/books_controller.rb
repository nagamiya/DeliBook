class Admin::BooksController < Admin::Base
	#def index
	#  @books = Book.order("id")
	#end

	def show
	  @book = Book.find(params[:id])
	  @rental_num = Book.rental_num(@book)
	  @reservation_num = Book.reservation_num(@book)
	  @zaiko = @book.stock_num - @rental_num
	end

	def new
          @book = Book.new
	end

	def edit
	end

	def create
	  #@book = Book.new(params[:book])
	  #if @book.publisher_id.present?
	  #  puts params[:publisher]
	  #else
	#	puts "NO"
	#  end
	#  @book.publisher_id = Book.get_pid(params[:publisher])

   	  @book = Book.new(book_params)


	#  @book.publisher_id = 3
       #   pid = Book.get_pid(@book)
	#  puts pid.ids
	#  @book.publisher_id = pid
	  
	#  if @book1.present?
	#    puts "present"
	#    puts @book1.publisher_id
	#  end

   	  puts "!!!!!!!!!!!!!admin/books/create"
   	  if @book.save
    	    redirect_to [:admin, @book], notice: "本の登録が完了しました"
    	  else
     	    render admin/root
	  end
	end

	def update
	end

	def destroy
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

  	private
  	def book_params          
    	#  attrs = [:name, :isbn, :authors_id, :publisher_id, :genre_id, :summary, :stock_num]
    	  params.require(:book).permit(:name, :isbn, :publisher_id, :genre_id, :summary, :stock_num, {:author_ids =>[]} )
  	end
end
