class Admin::RentalsController < Admin::Base

  def index #貸出一覧
    @rentals = Rental.order("id").where(return_date: nil)
  end

  def history_index #貸出履歴
    @rentals = Rental.order("id").where.not(return_date: nil).where(is_delivered: true)
  end

  def app_index #貸出申請
    @rentals = Rental.order("id").where(return_date: nil).where(is_delivered: false)
  end

  def search
    @rentals = Rental.search(params[:q])
    render "index"
  end

  def bookreturn
    require 'date'
    @rental = Rental.find(params[:id])   
    @rental.return_date = Date.today
    if @rental.save
      redirect_to admin_rentals_path, notice: "本の返却を受理しました。"
    else
      render "index"
    end
  end

  def defzaiko(rentalbook)
	book = Book.find_by(id: rentalbook.id)
	rental_num = Book.rental_num(rentalbook)
	puts "在庫数："
	puts rental_num
  	@zaiko = book.stock_num - rental_num
	return @zaiko
  end

  helper_method :defzaiko

end
