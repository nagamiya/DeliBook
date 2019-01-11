names = %w(ビジネスマナーブック ねことぼく Rails逆引き本 はじめてのスイーツレシピ 塩の街)
isbns = %w( 9784111111111 9784222222222 9784333333333 9784444444444 9784555555555)
genre_ids = %w(1 2 3 4 5)
publisher_ids = %w(1 2 3 4 5)
stock_nums = %w(2 3 4 5 6)
summarys = %w(誰でもすぐに身につくかもしれないマナーブック。 生き物の大切さを知ることができるこどもむけ絵本。 
このシステムも作れるようになる、Railsでの開発はこれ１本。 おいしいスイーツを作って女子力をあげよう！ "塩害"が発生した街で交錯する人間たちのストーリー)

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
	    @author = Author.find( (( idx + 1) + idx2) % 5 + 1 )
	    @book.authors << @author
	    puts "idx:" + idx.to_s + ", idx2:" + idx2.to_s + ", name:" + @author.name
	end
end