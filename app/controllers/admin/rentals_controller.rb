class Admin::RentalsController < Admin::Base

  def index #貸出一覧
    @rentals = Rental.order("id").where(return_date: nil).where(is_delivered: true)
  end

  def history_index #貸出履歴一覧
    @rentals = Rental.order("id").where.not(return_date: nil).where(is_delivered: true)
  end

  def app_index #貸出申請一覧
    @rentals = Rental.order("id").where(return_date: nil).where(is_delivered: false)
  end

  def create
    puts "!!!!!!!!!!!!!!create(admin)!!!!!!!!!!"
    puts params[:member]
    puts params[:book]
    @rental = Rental.new(book_id: params[:book], member_id: params[:member], rent_date: Date.today, is_delivered: false)
    if @rental.save
      redirect_to controller: "books", action: "show", id: params[:book], notice: "貸出申請代替が完了しました"
    else
      render controller: "book", action: "show", id: params[:book], notice: "貸出申請代替に失敗しました"
    end
  end

  def search
    @rentals = Rental.search(params[:q])
    render "index"
  end

  def bookreturn #返却
    require 'date'
    @rental = Rental.find(params[:id])   
    @rental.return_date = Date.today
    if @rental.save
      redirect_to admin_rentals_path, notice: "本の返却を受理しました。"
    else
      render "index"
    end
  end

  def rental_do #貸出実行
    puts "rental do"
    @rental = Rental.find(params[:id])
    @rental.is_delivered = true
    if @rental.save
      redirect_to app_index_admin_rentals_path, notice: "本の貸出を実行しました。"
    else
      render "index"
    end
  end

  def defzaiko(rentalbook)
	book = Book.find_by(id: rentalbook.id)
	rental_num = Book.rental_num(rentalbook)
	puts rental_num
  	@zaiko = book.stock_num - rental_num
	return @zaiko
  end

  helper_method :defzaiko

end
