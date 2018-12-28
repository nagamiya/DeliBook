class RentalsController < ApplicationController
  def index
    if params[:member_id]
	puts "bbbbbbbbbbbbbbbb"
      @member = Member.find(params[:member_id])
      @rentals = @member.rentals
    end
  end
end
