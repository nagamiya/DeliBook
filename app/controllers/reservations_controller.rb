class ReservationsController < ApplicationController
  def index
    if params[:member_id]
	puts "aaaaaaaaaaaaaaaa"
        @member = Member.find(params[:member_id])
        @reservations = @member.reservations
	@book = Book.find_by(params[:rs])
	rental_num = Book.rental_num(@book)
	#puts rental_num
	#puts @book.stock_num
  	@zaiko = @book.stock_num - rental_num
	#puts @zaiko
    end
  end

  def create
	puts "create!!!!!!!!!!"
	#if params[:book_id].present?
	#  puts "bbbbbbbbbbbbb" 
	#else
	#  puts "cccccccccccCC" #ずっとこっち
	#end
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

end
