class Member < ActiveRecord::Base
	has_many :reservations, dependent: :destroy
	has_many :rentals, dependent: :destroy

	attr_accessor :password, :password_confirmation

	def password=(val)
	  if val.present?
	    self.hashed_password = BCrypt::Password.create(val)
	  end
	  @password = val
	end
end
