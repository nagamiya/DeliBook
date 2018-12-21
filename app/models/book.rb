class Book < ActiveRecord::Base
	has_many :reservations, dependent: :destroy
	has_many :rentals, dependent: :destroy
	belongs_to :genre
	belongs_to :publisher
        has_many :book_authors, dependent: :destroy
        has_many :authors, through: :book_authors

	class << self
	  def search(query)
	     rel = order("number")
	     if query.present?
		rel = Book.joins(:authors, :publisher, :genre)
		rel = rel.where("Books.name LIKE ? " , "%#{query[0]}%")
		rel = rel.where("Authors.name LIKE ? " , "%#{query[1]}%")
		rel = rel.where("Publishers.name LIKE ? " , "%#{query[2]}%")
		rel = rel.where("Genres.name LIKE ? ", "%#{query[3]}%")
		rel = rel.distinct
	     end
	   # name = "",author = "", publisher = "", genre = ""
	   # rel = order("id");
	   # if query[0].present?
	   #   name = query[0]
	   #   puts "name:" + name
	   # end
	   # if query[1].present?
	   #   author = Author.find_by
	   #   puts "author:" + author
	   # end
	   # if query[2].present?
	   #   publisher = Publisher.find_by(name: query[2]).id
	   #   puts "publisher:" + publisher.to_s
	   # end
	   # if query[3].present?
	   #   genre = Genre.find_by(name: query[3]).id
	   #   puts "genre:" + genre.to_s
	   # end

	    #rel = rel.where("(name LIKE ?) AND (publisher_id LIKE ?) AND (genre_id LIKE ?)",
		#	"%#{name}%","%#{publisher}%","%#{genre}%")
	    rel 
	  end

	end
end
