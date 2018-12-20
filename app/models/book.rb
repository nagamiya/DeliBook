class Book < ActiveRecord::Base
	has_many :reservations, dependent: :destroy
	has_many :rentals, dependent: :destroy
	belongs_to :genre
	belongs_to :publisher
        has_many :book_authors, dependent: :destroy
        has_many :authors, through: :book_authors

	class << self
	  def search
	  end
	end
end
