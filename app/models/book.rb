class Book < ActiveRecord::Base
	has_many :reservations, dependent: :destroy
	has_many :rentals, dependent: :destroy
	belongs_to :genre
	belongs_to :publisher
        has_many :book_authors, dependent: :destroy
        has_many :authors, through: :book_authors

	class << self
	  def search(query)
	     rel = order("id")
	     if query.present?
		rel = Book.joins(:authors, :publisher, :genre)
		rel = rel.where("Books.name LIKE ? " , "%#{query[0]}%")
		rel = rel.where("Authors.name LIKE ? " , "%#{query[1]}%")
		rel = rel.where("Publishers.name LIKE ? " , "%#{query[2]}%")
		rel = rel.where("Genres.name LIKE ? ", "%#{query[3]}%")
		rel = rel.distinct
	     end
	    rel 
	  end

	end
end
