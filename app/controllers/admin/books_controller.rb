class Admin::BooksController < Admin::Base
	def index
	  @books = Book.order("id").paginate(page: params[:page], per_page: 5)
	end

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
	  @book = Book.find(params[:id])
	end

	def create
   	  @book = Book.new(book_params)
   	 # puts "!!!!!!!!!!!!!admin/books/create"
   	  if @book.save
    	    redirect_to [:admin, @book], notice: "本の登録が完了しました"
    	  else
     	    render admin/root
	  end
	end

	def update
	  @book = Book.find(params[:id])
	  @book.assign_attributes(book_params)
	  if @book.save
	    redirect_to [:admin, @book], notice: "本の詳細情報を更新しました。"
	  else
	    render "edit"
	  end
	end

	def destroy
	  @book = Book.find(params[:id])
	  @rentals = Rental.order("id").where(book_id: @book.id).where(return_date: nil)
	  @reservations = Reservation.order("id").where(book_id: @book.id).where(is_processed: false)
	  if @rentals.empty? and @reservations.empty?
            @book.destroy
            redirect_to search_admin_books_path, notice: "該当する本を削除しました。"
	  else
	    redirect_to admin_book_path, notice: "削除に失敗しました。貸出・予約処理が終了していません。"
	  end
	end

	def search 
	  @book_title = params[:book_title]
	  @book_author = params[:book_author]
	  @book_publisher = params[:book_publisher]
	  @book_genre = params[:book_genre]
	  @book_info = [@book_title, @book_author, @book_publisher, @book_genre]

	  @books = Book.search(@book_info).paginate(page: params[:page], per_page: 5)
	  render "index"
	end

        def defzaiko(book)
	  book = Book.find_by(id: book.id)
	  rental_num = Book.rental_num(book)
  	  @zaiko = book.stock_num - rental_num
	  return @zaiko
        end
        helper_method :defzaiko

  	private
  	def book_params          
    	  params.require(:book).permit(:name, :isbn, :publisher_id, :genre_id, :summary, :stock_num, {:author_ids =>[]} )
  	end
end
