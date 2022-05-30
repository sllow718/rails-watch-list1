# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "json"
require "open-uri"

# puts "Bookmark and Movies destroyed"
# require "pry-byebug"

# seed list
"Destroying all shit...."
List.destroy_all
Bookmark.destroy_all
Movie.destroy_all
"All shit is destroyed..."

list_url = "https://tmdb.lewagon.com/genre/movie/list"
list_serialized = URI.open(list_url).read
lists = JSON.parse(list_serialized)

lists["genres"].each do |list|
  list = List.new(
    name: list["name"]
  )
  list.save
end

# seed movies
for i in 555..1000 do
  # sleep(3)
  url = "https://tmdb.lewagon.com/movie/" + i.to_s
  user_serialized = URI.open(url).read
  user = JSON.parse(user_serialized)
  # binding.pry

  if user["genres"].is_a? Array
    movie = Movie.new(
      title: user["title"],
      overview: user["overview"],
      rating: user["vote_average"],
      poster_url: user["poster_path"]
    )

    movie.save

    # binding.pry
    bookmark = Bookmark.new(
      comment: user["overview"],
      movie: movie,
      list: List.all.where(name: "#{user['genres'][0]['name']}")[0]
    )
    bookmark.save if movie

    puts "bookmark #{i} with #{movie} and #{bookmark} saved"
  end
end

puts 'database successfully populated...'
