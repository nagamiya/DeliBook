class ReservationsController < ApplicationController
  def index
    if params[:member_id]
        @member = Member.find(params[:member_id])
        @reservations = @member.reservations.where(is_processed: false)
	.paginate(page: params[:page], per_page: 5)
    end
  end

  def create
	@reservation = Reservation.new(book_id: params[:book_id], member_id: current_member.id, app_date: Date.today, is_processed: false)
	if @reservation.save
	  flash[:notice] = "貸出予約申請が完了しました"
	  redirect_to controller: "books", action: "show", id: params[:book_id]
	else
	  flash[:notice] = "貸出予約申請に失敗しました"
	  render controller: "books", action: "show", id: params[:book_id]
	end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy 
    flash[:notice] = "予約を取り消しました" 
    redirect_to action: "index"
  end

  def defzaiko(rs)
	book = Book.find_by(id: rs.id)
	rental_num = Book.rental_num(rs)
  	@zaiko = book.stock_num - rental_num
	return @zaiko
  end

  helper_method :defzaiko

end
