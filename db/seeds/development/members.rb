user_ids = %w(nagamiyaid toosakaid emiyaid iriyaid giruid)
names = %w(永宮舞帆 遠坂凛 衛宮士郎 イリヤスフィール ギルガメッシュ)
places = %w(ウルク 冬木 冬木 冬木 ウルク)
tels = %w(000-0000 111-1111 222-2222 333-3333 444-4444)
mail_addresses = %w(nagamiya000 toosaka111 emiya222 iriya333 giru444)
#passwords = %w(mahomaho rinrin sirosiro iriiri girugiru)
0.upto(4) do |idx|
          puts idx
	Member.create!(
	  user_id: user_ids[idx],
	  name: names[idx],
	  place: places[idx],
	  tel: tels[idx],
	  mail_address: "#{mail_addresses[idx]}@mail.com",
	  is_admin: ( idx == 0 ),
	  password: "password",
	  password_confirmation: "password"
	)
end