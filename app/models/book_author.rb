class BookAuthor < ActiveRecord::Base
	belongs_to :book
	belongs_to :author

	validates :author_id, presence: true
end
