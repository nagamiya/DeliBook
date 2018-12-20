class Book < ActiveRecord::Base
	has_many :reservations, dependent: :destroy
	has_many :rentals, dependent: :destroy
	belongs_to :genre
	belongs_to :publisher
        has_many :book_authors, dependent: :destroy
        has_many :authors, through: :book_authors

	class << self
	  def search(query)
	    rel = order("id");
	    if query.present?
	      rel = rel.where("name LIKE ?", "%#{query}%")
	    end
	    rel 
	  end
	end
end
