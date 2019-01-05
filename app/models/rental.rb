class Rental < ActiveRecord::Base
	belongs_to :member
	belongs_to :book

  class << self
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
