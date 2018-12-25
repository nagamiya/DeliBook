class Member < ActiveRecord::Base
  has_many :reservations, dependent: :destroy
  has_many :rentals, dependent: :destroy

  #validates :password, confirmation: { allow_blank: true }

  attr_accessor :hashed_password, :password_confirmation

  def defpassword=(val)
	puts "defpassword start!!"
	if val.present?
		self.password = BCrypt::Password.create(val)
		puts "pass::" + self.password
	end
	@defpassword = val
  end

  class << self
    def authenticate(user_id, pswd)
      member = find_by(user_id: user_id)
      if member && member.password.present? &&
        BCrypt::Password.new(member.password) == pswd
        member
      else
        nil
      end
    end
  end

end
