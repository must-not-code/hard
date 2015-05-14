# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create([{ username: 'admin', password: '123456', email: 'test4food@me.com', group: 'admin' }])

Carousel.create([{ title: 'Lorem ipsum 1', url: '/', position: 1 },
                 { title: 'Lorem ipsum 2', url: '/', position: 2 }])

Event.create([{ start_at: Time.now - 4*24*60*60, country: 'RU', enemy: 'RoX.KIS', tourney: 'SLTV', hr_score: 0, enemy_score: 1 },
              { start_at: Time.now - 3*24*60*60, country: 'RU', enemy: 'GPX', tourney: 'SLTV', hr_score: 1, enemy_score: 0 },
              { start_at: Time.now - 2*24*60*60, country: 'UA', enemy: 'Carpe Diem', tourney: 'SLTV' , hr_score: 2, enemy_score: 1 },
              { start_at: Time.now - 1*24*60*60, country: 'US', enemy: 'NAVI', tourney: 'SLTV', hr_score: 0, enemy_score: 3 },
              { start_at: Time.now,              country: 'UA', enemy: 'M5', tourney: 'SLTV' },
              { start_at: Time.now + 1*24*60*60, country: 'TR', enemy: 'Big Plays Inc.', tourney: 'IIT' },
              { start_at: Time.now + 2*24*60*60, country: 'TR', enemy: 'Team Turquality', tourney: 'IIT' },
              { start_at: Time.now + 3*24*60*60, country: 'RU', enemy: 'Virtus.pro', tourney: 'SLTV' }])

Stream.create([{ streamer: 'Kira', views: 123, online: true, channel: 'kirrrrra'},
               { streamer: 'Dimonko', views: 0, online: false, channel: 'd1monko'},
               { streamer: 'DinSHDin', views: 321, online: true, channel: 'dinshdin'},
               { streamer: 'WildHeart', views: 0, online: false, channel: 'wildheartpwn3r'}])

Crew.create([{ game: 'lol', title: 'League of Legends', logo: 'lol_logo.png' },
             { game: 'dota', title: 'DOTA 2', logo: 'dota_logo.png' }])

Post.create(title: 'Lorem ipsum', user_id: 1, game: 'lol', content: '<p><img style="float: left;" src="http://hardrandom.com/posts/14/d7de72552.png" alt="" height="150" width="150" />Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut aliquet interdum velit, quis pretium nulla. Vestibulum tempor sit amet ex eu egestas. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Sed posuere malesuada posuere. Cras sit amet lacus nec neque interdum venenatis. Mauris ut libero diam. Proin non eleifend justo. Vivamus massa tellus, mattis at lobortis sit amet, ultricies ut sem. Mauris a tortor pulvinar, euismod enim id, aliquam erat.<br /><br />Duis justo odio, egestas eget risus sit amet, rutrum eleifend metus. Curabitur id rutrum diam, vitae fringilla urna. Curabitur lacinia fermentum leo et gravida. Etiam venenatis id magna in faucibus. Nam eget erat molestie, vulputate diam quis, sagittis leo. Sed non consequat eros. Donec ut semper leo. Donec elementum urna eu sodales semper. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Pellentesque sed orci sed felis scelerisque malesuada sed vitae ante. Donec lectus dui, laoreet ac tempus vel, iaculis ac neque. Nulla ullamcorper maximus venenatis. Curabitur luctus nibh metus, nec finibus arcu pulvinar quis.<br /><br />Fusce blandit lorem ut aliquet dignissim. Pellentesque laoreet non diam sed imperdiet. Fusce eget cursus dui. Mauris sit amet purus urna. Ut nunc neque, elementum sit amet enim in, molestie placerat nisi. Maecenas quis nibh lobortis, sollicitudin dui in, semper diam. Nam gravida sit amet quam et consequat. Quisque varius tincidunt dolor quis semper. Sed scelerisque sit amet magna at accumsan. Quisque in neque urna. Nulla lacinia dolor in feugiat facilisis. Maecenas non porta risus. Pellentesque id purus eu velit pretium luctus ut pharetra massa. Integer vitae elementum mi, ut eleifend magna.</p>')
