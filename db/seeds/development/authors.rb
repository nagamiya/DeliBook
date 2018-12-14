names = %w(有川浩 三秋縋 雪乃紗衣 あんびるやすこ はやみねかおる)

0.upto(4) do |idx|
	Author.create(
	  name: names[idx]
	)
end