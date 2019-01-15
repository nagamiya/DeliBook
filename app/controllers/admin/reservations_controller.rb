class Admin::ReservationsController < Admin::Base
  def index
    @reservations = Reservation.order("id").where(is_processed: false)
	.paginate(page: params[:page], per_page: 5)
  end

  def create
    puts "!!!!!!!!!!!!!!create(admin)!!!!!!!!!!"
    puts params[:member]
    puts params[:book]
    @reservation = Reservation.new(book_id: params[:book], member_id: params[:member], app_date: Date.today, is_processed: false)
    if @reservation.save
      flash[:notice] = "予約申請代替が完了しました"
      redirect_to controller: "books", action: "show", id: params[:book]
    else
      flash[:notice] =  "予約申請代替に失敗しました"
      render controller: "book", action: "show", id: params[:book]
    end
  end

  def destroy
    puts "aaaaaaaaaaaaaaaaaaa"
    @reservation = Reservation.find(params[:id])
    puts @reservation.id
    @reservation.destroy 
    flash[:notice] = "予約を取り消しました" 
    redirect_to action: "index"
  end

  def search
    @reservations = Reservation.search(params[:q]).where(is_processed: false)
	.paginate(page: params[:page], per_page: 5)
    render "index"
  end

  def defzaiko(reservationbook)
	book = Book.find_by(id: reservationbook.id)
	rental_num = Book.rental_num(reservationbook)
  	@zaiko = book.stock_num - rental_num
	return @zaiko
  end
  helper_method :defzaiko
end
