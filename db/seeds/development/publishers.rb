names = %w(新潮社 KADOKAWA 幻冬舎 集英社 講談社)

0.upto(4) do |idx|
	Publisher.create(
	  name: names[idx]
	)
end
