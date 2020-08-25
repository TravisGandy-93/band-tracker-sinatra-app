takeova_band = Band.create(name: "T.O.B")
new_impressionz = Band.create(name: "New Impressionz")
three_six_mafia = Band.create(name: "36Mafia")
sonder = Band.create(name: "Sonder")
earth_gang = Band.create(name: "Earthgang")
the_internet = Band.create(name: "The Internet")

tom = User.create(username: "Tom", password: "111111")
mark = User.create(username: "Mark", password: "222222")

Track.create(name: "Back Stroke", band: takeova_band, user: tom)
Track.create(name: "Take Em To Church", band: takeova_band, user: mark)

Track.create(name: "My Chick", band: new_impressionz, user: tom)
Track.create(name: "Move Your Body", band: new_impressionz, user: mark)

Track.create(name: "Stay Fly", band: three_six_mafia, user: tom)
Track.create(name: "Poppin My Collar", band: three_six_mafia, user: mark)

Track.create(name: "Too Fast", band: sonder, user: tom)
Track.create(name: "Searchin", band: sonder, user: mark)

Track.create(name: "Bank", band: earth_gang, user: tom)
Track.create(name: "Fields", band: earth_gang, user: mark)

Track.create(name: "Girl", band: the_internet, user: tom)
Track.create(name: "Special Affair", band: the_internet, user: mark)