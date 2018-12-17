book_ids = %w(0 1 2)
member_ids = %w(0 1 2)
rent
summarys = %w(aaaaaaaaa bbbbbbbbb cccccccc dddddddddd eeeeeeee)
0.upto(2) do |idx|
	Rental.create(
	  name: names[idx],
	  isbn: isbns[idx],
	  genre_id: genre_ids[idx],
	  publisher_id: publisher_ids[idx],
	  stock_num: stock_nums[idx],
	  summary: summarys[idx]
	)
end