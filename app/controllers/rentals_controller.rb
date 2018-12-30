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

  def create
	puts "!!!!!!!!!!!!!!create!!!!!!!!!!"
	#if params[:book_id].present?
	#  puts "bbbbbbbbbbbbb" 
	#else
	#  puts "cccccccccccCC" #ずっとこっち
	#end
	@rental = Rental.new(book_id: params[:book_id], member_id: current_member.id, rent_date: Date.today, is_delivered: false)
	if @rental.save
	  redirect_to controller: "books", action: "show", id: params[:book_id], notice: "貸出申請が完了しました"
	else
	  render controller: "book", action: "show", id: params[:book_id], notice: "貸出申請に失敗しました"
	end
  end
end
