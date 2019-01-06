names = %w(英雄王 有川浩 太陽王 始皇帝 岸波白野)

0.upto(4) do |idx|
	Author.create(
	  name: names[idx]
	)
end