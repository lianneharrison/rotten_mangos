# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Movie.create!(
  title: "Ghost World",
  director: "Terry Zwigoff",
  runtime_in_minutes: 120,
  description: "This is the story of Enid and Rebecca after they
  finish the high school. Both have problems relating to people and
  they spend their time hanging around and bothering creeps.
  When they meet Seymour who is a social outsider who loves to collect
  old 78 records, Enid's life will change forever",
  poster_image_url: "http://www.gstatic.com/tv/thumb/movieposters/28096/p28096_p_v7_aa.jpg",
  release_date: "2001/07/20"
)
