class Admin::RentalsController < Admin::Base

  def index #貸出一覧
    @rentals = Rental.order("id").where(return_date: nil).where(is_delivered: true)
	.paginate(page: params[:page], per_page: 5)
  end

  def history_index #貸出履歴一覧
    @rentals = Rental.order("id").where.not(return_date: nil)#.where(is_delivered: true)
	.paginate(page: params[:page], per_page: 5)
  end

  def app_index #貸出申請一覧
    @rentals = Rental.order("id").where(return_date: nil).where(is_delivered: false)
	.paginate(page: params[:page], per_page: 5)
  end

  def create
    @rental = Rental.new(book_id: params[:book], member_id: params[:member], rent_date: Date.today, is_delivered: false)
    if @rental.save
      flash[:notice] = "貸出申請代替が完了しました"
      redirect_to controller: "books", action: "show", id: params[:book]
    else
      render "show", text: "貸出申請代替に失敗しました"
    end
  end

  def create_fromreservation
    puts "!!!!!!!!!!!!!!createfromreservation(admin)!!!!!!!!!!"
    puts params[:member]
    puts params[:book]
    @reservation = Reservation.find(params[:id])
    @reservation.is_processed = true
    @rental = Rental.new(book_id: params[:book], member_id: params[:member], rent_date: Date.today, is_delivered: false)
    if @rental.save && @reservation.save
      flash[:notice] = "予約申請を貸出申請に移行しました"
      redirect_to controller: "reservations", action: "index"
    else
      flash[:notice] = "予約申請の貸出申請移行に失敗しました"
      redirect_to controller: "reservations", action: "index"
    end
  end

  def rental_search
    @rentals = Rental.search(params[:q])
	.where(return_date: nil).where(is_delivered: true)
	.paginate(page: params[:page], per_page: 5)
    render "index"
  end

  def history_search
    @rentals = Rental.search(params[:q])
	.where.not(return_date: nil)#.where(is_delivered: true)
	.paginate(page: params[:page], per_page: 5)
    render "history_index"
  end

  def app_search
    @rentals = Rental.search(params[:q])
	.where(return_date: nil).where(is_delivered: false)
	.paginate(page: params[:page], per_page: 5)
    render "app_index"
  end

  def bookreturn #返却
    require 'date'
    @rental = Rental.find(params[:id])   
    @rental.return_date = Date.today
    if @rental.save
      flash[:notice] = "本の返却を受理しました。"
      redirect_to controller: "rentals", action: "index"
    else
      render "index"
    end
  end

  def rental_do #貸出実行
    puts "rental do"
    @rental = Rental.find(params[:id])
    @rental.is_delivered = true
    if @rental.save
      flash[:notice] = "本の貸出を実行しました。"     
      redirect_to controller: "rentals", action: "app_index"
    else
      render "app_index"
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
