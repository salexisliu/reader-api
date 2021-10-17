# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

b1 = Book.create(title: "Stone Soup", summary: "a short story", author: "anon", finished: nil, user_id: 3)

l1 = Line.create(book_id: b1.id, content: "A kindly, old stranger was walking through the land when he came upon a village.  As he entered, the villagers moved towards their homes locking doors and windows.", highlighted: nil)
l2 = Line.create(book_id: b1.id, content: "The stranger smiled and asked, why are you all so frightened. I am a simple traveler, looking for a soft place to stay for the night and a warm place for a meal.", highlighted: nil)
l3 = Line.create(book_id: b1.id, content: "There's not a bite to eat in the whole province We are weak and our children are starving. Better keep moving on.", highlighted: nil)
l4 = Line.create(book_id: b1.id, content: "Oh, I have everything I need, he said. In fact, I was thinking of making some stone soup to share with all of you. He pulled an iron cauldron from his cloak, filled it with water, and began to build a fire under it.", highlighted: nil)
l5 = Line.create(book_id: b1.id, content: "Then, with great ceremony, he drew an ordinary-looking stone from a silken bag and dropped it into the water.", highlighted: nil)
l6 = Line.create(book_id: b1.id, content: "By now, hearing the rumor of food, most of the villagers had come out of their homes or watched from their windows.  As the stranger sniffed the broth and licked his lips in anticipation, hunger began to overcome their fear.", highlighted: nil)
l7 = Line.create(book_id: b1.id, content: "Ahh, the stranger said to himself rather loudly, I do like a tasty stone soup.  Of course, stone soup with cabbage -- that's hard to beat.", highlighted: nil)
l8 = Line.create(book_id: b1.id, content: "Soon a villager approached hesitantly, holding a small cabbage he'd retrieved from its hiding place, and added it to the pot.", highlighted: nil)
l8 = Line.create(book_id: b1.id, content: "Wonderful!! cried the stranger. You know, I once had stone soup with cabbage and a bit of salt beef as well, and it was fit for a king.", highlighted: nil)

n1 = Note.create(line_id: l1.id, content: "beginning of story")
n1 = Note.create(line_id: l7.id, content: "end of story")

puts "finished seeding"