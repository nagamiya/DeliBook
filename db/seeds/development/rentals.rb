book_ids = %w(1 2 2 2 3 4)
member_ids = %w(1 2 3 1 4 5)
rent_dates = ["2018-12-01", "2018-12-10", "2018-12-20","2019-1-01", "2019-1-10", "2019-1-20"]
return_dates = ["2018-12-08", "2018-12-17", "2018-12-27", nil, nil, nil]
0.upto(5) do |idx|
	Rental.create(
	  book_id: book_ids[idx],
	  member_id: member_ids[idx],
	  rent_date: rent_dates[idx],
	  return_date: return_dates[idx],
	  is_delivered: (idx == 0 || idx == 1 || idx == 2 || idx == 3 )
	)
end