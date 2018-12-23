class Member < ActiveRecord::Base
  has_many :reservations, dependent: :destroy
  has_many :rentals, dependent: :destroy

  attr_accessor :hashed_password, :password_confirmation

  def defpassword=(val)
	puts "defpassword start!!"
	if val.present?
		self.password = BCrypt::Password.create(val)
		puts "pass::" + self.password
	end
	@defpassword = val
  end

end
