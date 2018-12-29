class Reservation < ActiveRecord::Base
	belongs_to :member
	belongs_to :book
	
	class << self
	  def title(q)
	    rel = order("id")
	    if q.present?
		rel = Reservation.joins(:books)
		rel = rel.where("Books.id = ?", "q")
	    end
	  end

	  #def rental_num(query)
	  #   rel = order("id")
	  #   if query.present?
	#	#puts "pppppppppppppppppp"
	#	#puts query.id
	#	rel = Reservation.joins(:book)
	#	rel = rel.where("Reservations.book_id = ? " , query.id)
	#	rel = rel.count
	 #    end
	  #  rel 
	  #end
	end

end
