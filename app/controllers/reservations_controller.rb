class ReservationsController < ApplicationController
  def index
    if params[:member_id]
	puts "aaaaaaaaaaaaaaaa"
        @member = Member.find(params[:member_id])
        @reservations = @member.reservations
    end
  end

  def create
	@reservation = Reservation.new(book_id: params[:book_id], member_id: current_member.id, app_date: Date.today, is_processed: false)
	if @reservation.save
	  redirect_to controller: "books", action: "show", id: params[:book_id], notice: "貸出予約申請が完了しました"
	else
	  render controller: "books", action: "show", id: params[:book_id], notice: "貸出予約申請に失敗しました"
	end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy 
    redirect_to action: "index", notice: "予約を取り消しました" 
  end

  def defzaiko(rs)
	book = Book.find_by(id: rs.id)
	rental_num = Book.rental_num(rs)
  	@zaiko = book.stock_num - rental_num
	return @zaiko
  end

  helper_method :defzaiko

end
