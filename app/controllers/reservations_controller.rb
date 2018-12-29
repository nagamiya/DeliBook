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

 # def title(q)
#	@title = Reservation.title(q)
 # end

 # helper_method :title
  helper_method :zaiko
end
