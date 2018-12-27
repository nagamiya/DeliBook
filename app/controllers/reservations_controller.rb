class ReservationsController < ApplicationController
  def index
    if params[:member_id]
	puts "aaaaaaaaaaaaaaaa"
      @member = Member.find(params[:member_id])
      @reservations = @member.reservations
    end
  end

  def title(q)
	@title = Reservation.title(q)
  end

  helper_method :title
end
