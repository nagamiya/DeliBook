class Admin::RentalsController < Admin::Base

  def index
    @rentals = Rental.order("id")
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
  	@zaiko = book.stock_num - rental_num
	return @zaiko
  end

  helper_method :defzaiko

end
