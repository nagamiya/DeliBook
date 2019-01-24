class Book < ActiveRecord::Base
	has_many :reservations, dependent: :destroy
	has_many :rentals, dependent: :destroy
	belongs_to :genre
	belongs_to :publisher
        has_many :book_authors, dependent: :destroy
        has_many :authors, through: :book_authors

	validates :isbn, presence: true,
	  length: { is: 13 },
	  uniqueness: true
	#validates :book_authors, 
	#length: { minimum: 1,
	#	    message: "を１つ以上選択してください" }
	validates :publisher_id, presence: true
	validates :genre_id, presence: true
	validates :stock_num, presence: true,
	  numericality: { only_integer: true, greater_than_or_equal_to: 0}
	  

	class << self
	  def search(query)
	     if query.present?
		rel = Book.joins(:authors, :publisher, :genre)
		rel = rel.where("Books.name LIKE ? " , "%#{query[0]}%")
		rel = rel.where("Authors.name LIKE ? " , "%#{query[1]}%")
		rel = rel.where("Publishers.name LIKE ? " , "%#{query[2]}%")
		rel = rel.where("Genres.name LIKE ? ", "%#{query[3]}%")
		rel = rel.distinct
	        rel = order("id")
	     end
	    rel 
	  end

	  def rental_num(query)
	     rel = order("id")
	     if query.present?
		#puts "pppppppppppppppppp"
		#puts query.id
		rel = Book.joins(:rentals)
		rel = rel.where("Rentals.book_id = ? " , query.id)
		rel = rel.where("rentals.return_date is null")
		rel = rel.count
	     end
	    rel 
	  end

	  def reservation_num(query)
	     rel = order("id")
	     if query.present?
		#puts "pppppppppppppppppp"
		#puts query.id
		rel = Book.joins(:reservations)
		rel = rel.where("Reservations.book_id = ? " , query.id)
		rel = rel.where("Reservations.is_processed = ? ", false)
		rel = rel.count
	     end
	    rel 
	  end

          def get_pid(q)
            puts "---------change_id START"
	    puts q
            rel = order("id")
	    if q.present?
	       rel = rel.select("publishers.id")
	       rel = Book.joins(:publisher)
	       rel = rel.where("Publishers.name LIKE ?" , q)

	    end
            rel
          end

	end
end
