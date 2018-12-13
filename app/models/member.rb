class Member < ActiveRecord::Base
	has_many :reservations, dependent: :destroy
	has_many :rentals, dependent: :destroy
end
