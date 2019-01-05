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

          def search(query)
            rel = order("id")
            if query.present?
	      rel = rel.joins(:book)
              rel = rel.where("books.name LIKE ?", "%#{query}%")
            end
           rel
          end

	end

end
