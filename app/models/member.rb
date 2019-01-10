class Member < ActiveRecord::Base
  has_many :reservations, dependent: :destroy
  has_many :rentals, dependent: :destroy

 validates :user_id, presence: true,
    format: { with: /\A[A-Za-z]\w*\z/, allow_blank: true },
    length: { minimum: 2, maximum: 20, allow_blank: true },
    uniqueness: true
  validates :name, presence: true,
    length: { maximum: 20 }
  #住所
  validates :tel, presence: true,
    format: { with: /\A[0-9()-]+\z/, allow_blank: true},
    length: { maximum: 15, allow_blank: true },
    uniqueness: { case_sensitive: false }
  validates :mail_address, presence: true,#:check_email
    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
    uniqueness: { case_sensitive: false }
  validates :password, presence: { on: :create },
    confirmation: { allow_blank: true }
  attr_accessor :password, :password_confirmation

  def password=(val)
	puts "password start!!"
	if val.present?
		self.hashed_password = BCrypt::Password.create(val)
		puts "pass::" + self.hashed_password
	end
	@password = val
  end

  class << self
    def search(query)
      rel = order("id")
      if query.present?
        rel = rel.where("name LIKE ?",
          "%#{query}%")
      end
      rel
    end

    def authenticate(user_id, password)
      member = find_by(user_id: user_id)
      if member && member.hashed_password.present? &&
        BCrypt::Password.new(member.hashed_password) == password
        member
      else
        nil
      end
    end
  end

end
