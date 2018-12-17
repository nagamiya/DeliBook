book_ids = %w(0 1 2)
member_ids = %w(0 1 2)
rent_dates = ["2018-12-01", "2018-12-10", "2018-12-20"]
return_dates = ["2018-12-08", "2018-12-17", "2018-12-27"]
0.upto(2) do |idx|
	Rental.create(
	  book_id: book_ids[idx],
	  member_id: member_ids[idx],
	  rent_date: rent_dates[idx],
	  return_date: return_dates[idx],
	  is_delivered: (idx == 0 || idx == 1 )
	)
end