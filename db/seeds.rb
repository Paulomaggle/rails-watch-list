require 'open-uri'
require 'json'

url = "https://tmdb.lewagon.com/movie/top_rated"

# Récupère et parse les données JSON de l'API
movies_serialized = URI.open(url).read
movies = JSON.parse(movies_serialized)['results']

# Crée seulement 10 films
movies.first(10).each do |movie_data|
  Movie.create(
    title: movie_data['title'],
    overview: movie_data['overview'],
    rating: movie_data['vote_average'],
    poster_url: "https://image.tmdb.org/t/p/w500/#{movie_data['poster_path']}"
  )
end

# Movie.create(title: "Wonder Woman 1984", overview: "Wonder Woman comes into conflict with the Soviet Union during the Cold War in the 1980s", poster_url: "https://image.tmdb.org/t/p/original/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg", rating: 6.9)
# Movie.create(title: "The Shawshank Redemption", overview: "Framed in the 1940s for double murder, upstanding banker Andy Dufresne begins a new life at the Shawshank prison", poster_url: "https://image.tmdb.org/t/p/original/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg", rating: 8.7)
# Movie.create(title: "Titanic", overview: "101-year-old Rose DeWitt Bukater tells the story of her life aboard the Titanic.", poster_url: "https://image.tmdb.org/t/p/original/9xjZS2rlVxm8SFx8kPC3aIGCOYQ.jpg", rating: 7.9)
# Movie.create(title: "Ocean's Eight", overview: "Debbie Ocean, a criminal mastermind, gathers a crew of female thieves to pull off the heist of the century.", poster_url: "https://image.tmdb.org/t/p/original/MvYpKlpFukTivnlBhizGbkAe3v.jpg", rating: 7.0)

# https://image.tmdb.org/t/p/w500/
# https://image.tmdb.org/t/p/original/
