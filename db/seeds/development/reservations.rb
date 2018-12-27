book_ids = %w(1 2 3)
member_ids = %w(1 2 4)
app_dates = ["2018-11-29", "2018-12-7", "2018-12-18"]
0.upto(2) do |idx|
	Reservation.create(
	  book_id: book_ids[idx],
	  member_id: member_ids[idx],
	  app_date: app_dates[idx],
	  is_processed: (idx % 2 != 0 )
	)
end