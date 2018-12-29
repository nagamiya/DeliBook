class RentalsController < ApplicationController
  def index
    if params[:member_id]
	puts "bbbbbbbbbbbbbbbb"
        @member = Member.find(params[:member_id])
        @rentals = @member.rentals
	@book = Book.find_by(params[:rental])
	rental_num = Book.rental_num(@book)
	#puts rental_num
	#puts @book.stock_num
  	@zaiko = @book.stock_num - rental_num
	#puts @zaiko
    end
  end
end
