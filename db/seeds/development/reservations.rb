book_ids = %w(2 2)
member_ids = %w(1 5)
app_dates = ["2018-11-29", "2018-12-7"]
0.upto(1) do |idx|
	Reservation.create(
	  book_id: book_ids[idx],
	  member_id: member_ids[idx],
	  app_date: app_dates[idx],
	  is_processed: false
	)
end