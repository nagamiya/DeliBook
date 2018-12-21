user_ids = %w(nagamiyaid toosakaid emiyaid iriyaid)
names = %w(永宮舞帆 遠坂凛 衛宮士郎 イリヤスフィール)
places = %w(ウルク 冬木 冬木 冬木)
tels = %w(000 111 222 333)
mail_addresses = %w(nagamiya000 toosaka111 emiya222 iriya333)
#passwords = %w(mahomaho rinrin sirosiro iriiri)
0.upto(3) do |idx|
	Member.create(
	  user_id: user_ids[idx],
	  name: names[idx],
	  place: places[idx],
	  tel: tels[idx],
	  mail_address: mail_addresses[idx],
#	  password: "password",
	  is_admin: ( idx == 0 )
	)
end