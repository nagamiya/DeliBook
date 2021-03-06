class RentalsController < ApplicationController
  def index
    if params[:member_id]
        @member = Member.find(params[:member_id])
        @rentals = @member.rentals.where(return_date: nil)#.where(is_delivered: true)
	.paginate(page: params[:page], per_page: 5)
    end
  end

  def history_index #貸出履歴
    member_id = params[:member_id]
    @rentals = Rental.order("id").where.not(return_date: nil).where(is_delivered: true).where(member_id: member_id)
	.paginate(page: params[:page], per_page: 5)
  end

  def create
	@rental = Rental.new(book_id: params[:book_id], member_id: current_member.id, rent_date: Date.today, is_delivered: false)
	if @rental.save
	  flash[:notice] = "貸出申請が完了しました"
	  redirect_to controller: "books", action: "show", id: params[:book_id]
	else
	  flash[:notice] = "貸出申請に失敗しました"
	  render controller: "book", action: "show", id: params[:book_id]
	end
  end

  def defzaiko(rentalbook)
	book = Book.find_by(id: rentalbook.id)
	rental_num = Book.rental_num(rentalbook)
  	@zaiko = book.stock_num - rental_num
	return @zaiko
  end

  helper_method :defzaiko
end
