names = %w(ビジネス こども 学習 趣味 文芸)

0.upto(4) do |idx|
	Genre.create(
	  name: names[idx]
	)
end