names = %w(本 本本 本本本 本本本本 本本本本本)
isbns = %w(000-0000 111-1111 222-2222 333-3333 444-4444)
genre_ids = %w(0 1 2 3 4)
publisher_ids = %w(0 1 2 3 4)
stock_nums = %w(5 10 15 20 25)
summarys = %w(aaaaaaaaa bbbbbbbbb cccccccc dddddddddd eeeeeeee)

0.upto(4) do |idx|
	@book = Book.create(
	  name: names[idx],
	  isbn: isbns[idx],
	  genre_id: genre_ids[idx],
	  publisher_id: publisher_ids[idx],
	  stock_num: stock_nums[idx],
	  summary: summarys[idx]
	)

	if idx % 2 != 0 then	a = 2	end
	if idx % 2 == 0 then	a = 3	end
	1.upto(a) do |idx2|
	    @author = Author.find( (idx * idx2) % 5 + 1 )
	    @book.authors << @author
	end
end