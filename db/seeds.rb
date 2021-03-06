LOREM = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec consectetur aliquam ante, et consequat felis aliquet in. Sed aliquet, libero vel ultricies suscipit, mi nibh efficitur est, a pretium ligula metus eu risus. Phasellus molestie tellus id posuere aliquam. Nam ullamcorper ex et ipsum porttitor gravida. Donec lacinia mi id ornare blandit. Sed vitae sem odio. Proin nisi urna, dictum at urna in, semper congue ex. Nam in tellus in mauris efficitur dignissim. Suspendisse luctus sapien fermentum, efficitur erat ut, luctus elit. Duis gravida tellus est, et porttitor ante euismod vitae. Praesent id feugiat elit. Suspendisse eros elit, iaculis malesuada facilisis sed, sagittis sed neque. Praesent eu dolor laoreet mauris finibus gravida. Aliquam vulputate metus tortor. Fusce finibus, dolor ac sodales efficitur, lectus libero semper sem, et malesuada metus metus facilisis purus. Aliquam id nisi vel leo interdum interdum. Ut mauris nisi, rutrum non elit et, auctor scelerisque ante. Pellentesque placerat sit amet sem quis maximus. Vivamus at venenatis velit, ut accumsan justo. Sed mattis tortor quis eros imperdiet tincidunt. In lobortis ac nibh id ultricies. Morbi non venenatis lectus, vitae egestas nulla. Curabitur mi lectus, scelerisque sit amet magna in, pellentesque pellentesque felis. Duis id tellus vitae metus fermentum ultrices sed non ipsum. Cras dignissim sodales mattis. Vivamus facilisis sit amet leo eu rutrum. Fusce blandit nisi a dignissim congue. Etiam sem lorem, auctor vel ultricies sit amet, malesuada vel risus. In hac habitasse platea dictumst. Integer pellentesque porta maximus. Cras hendrerit consectetur magna eu tincidunt. Suspendisse facilisis augue mi, sed pellentesque velit tempor at. Nullam a scelerisque mi, sit amet dignissim massa. Proin posuere neque sit amet lectus rhoncus commodo.'

SHORT_LOREM = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec consectetur aliquam ante, et consequat felis aliquet in. Sed aliquet, libero vel ultricies suscipit, mi nibh efficitur est, a pretium ligula metus eu risus. Phasellus molestie tellus id posuere aliquam. Nam ullamcorper ex et ipsum porttitor gravida. Donec lacinia mi id ornare blandit. Sed vitae sem odio. Proin nisi urna, dictum at urna in, semper congue ex. Nam in tellus in mauris efficitur dignissim. Suspendisse luctus sapien fermentum, efficitur erat ut, luctus elit. Duis gravida tellus est, et porttitor ante euismod vitae. Praesent id feugiat elit. Suspendisse eros elit, iaculis malesuada facilisis sed, sagittis sed neque. Praesent eu dolor laoreet mauris finibus gravida. Aliquam vulputate metus tortor. Fusce finibus, dolor ac sodales efficitur, lectus libero.'

User.create([{ username: 'admin', password: '123456', email: 'test4food@me.com', group: 'admin', name: 'John Doe', country: 'RU', city: 'Зажопинск', skype: 'hard.random', vk: 'https://vk.com/hardrandom', facebook: 'https://www.facebook.com/hardrandom', twitter: 'https://twitter.com/HardRandom', twitch: 'http://www.twitch.tv/hardrandom', link: 'http://hardrandom.com',  about: SHORT_LOREM },
             { username: 'user', password: '123456', email: 'omfg.exe@gmail.com' }])

Carousel.create([{ title: 'Lorem ipsum 1', url: '/', position: 1 },
                 { title: 'Lorem ipsum 2', url: '/', position: 2 },
                 { title: 'Lorem ipsum 3', url: '/', position: 3 }])

Event.create([{ start_at: Time.zone.now - 4 * 24 * 60 * 60, country: 'RU', enemy: 'RoX.KIS', tourney: 'SLTV', hr_score: 0, enemy_score: 1 },
              { start_at: Time.zone.now - 3 * 24 * 60 * 60, country: 'RU', enemy: 'GPX', tourney: 'SLTV', hr_score: 1, enemy_score: 0 },
              { start_at: Time.zone.now - 2 * 24 * 60 * 60, country: 'UA', enemy: 'Carpe Diem', tourney: 'SLTV', hr_score: 2, enemy_score: 1 },
              { start_at: Time.zone.now - 1 * 24 * 60 * 60, country: 'US', enemy: 'NAVI', tourney: 'SLTV', hr_score: 0, enemy_score: 3 },
              { start_at: Time.zone.now,                    country: 'UA', enemy: 'M5', tourney: 'SLTV' },
              { start_at: Time.zone.now + 1 * 24 * 60 * 60, country: 'TR', enemy: 'Big Plays Inc.', tourney: 'IIT' },
              { start_at: Time.zone.now + 2 * 24 * 60 * 60, country: 'TR', enemy: 'Turquality', tourney: 'IIT', link: 'http://twitch.tv' },
              { start_at: Time.zone.now + 3 * 24 * 60 * 60, country: 'RU', enemy: 'Virtus.pro', tourney: 'SLTV', link: 'http://twitch.tv' }])

Stream.create([{ streamer: 'Kira', views: 123, online: true, channel: 'kirrrrra' },
               { streamer: 'TeamleSS', views: 555, online: true, channel: 'teamless2' },
               { streamer: 'Likkrit', views: 0, online: false, channel: 'likkrit' },
               { streamer: 'PvPStejos', views: 69, online: true, channel: 'chesland' },
               { streamer: 'Dimonko', views: 0, online: false, channel: 'd1monko' },
               { streamer: 'DinSHDin', views: 321, online: true, channel: 'dinshdin' },
               { streamer: 'WildHeart', views: 0, online: false, channel: 'wildheartpwn3r' }])

24.times { Video.create([{ title: 'PSY - GANGNAM STYLE', youtube_hash: '9bZkp7q19f0' }]) }

Team.create([{ game: 'lol', title: 'HR Pro' },
             { game: 'lol_academy', title: 'HR Academy' }])

Member.create([{ name: 'John Doe', nickname: 'Dno', role: 'Support', team_id: 1, vk: 'https://vk.com/hardrandom', twitch: 'https://vk.com/hardrandom', birthday: Time.zone.today, position: 1, status: 'captain', country: 'ru', city: 'Бобруйск', mouse: 'Coguar 200M', mouse_link: 'https://vk.com/hardrandom', keyboard: 'Coguar 500K', headset: 'Couguar 300H', pad: 'Couguar SPEED', pad_link: 'https://vk.com/hardrandom', about: SHORT_LOREM },
               { name: 'John Doe', nickname: 'Smurf', role: 'Top Laner', team_id: 1, vk: 'https://vk.com/hardrandom', twitch: 'https://vk.com/hardrandom', birthday: Time.zone.today, position: 2, country: 'ua', city: 'Бобруйск', about: SHORT_LOREM }])

36.times { Post.create(title: 'Lorem ipsum', user_id: 1, game: 'lol', content: "<p><img style='float: left;' src='http://hardrandom.com/posts/14/d7de72552.png' height='150' width='150'/>#{LOREM}</p>", published_at: Time.zone.now - 60) }

Partner.create(title: 'Durex', content_ru: LOREM, content_en: LOREM, vk: 'https://vk.com/hardrandom', fb: 'https://facebook.com/hardrandom', instagram: 'https://instagram.com/hardrandom', site: 'http://hardrandom.com/')

Page.create(title: 'about', content_ru: LOREM, content_en: LOREM)
