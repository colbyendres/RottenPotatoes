# Seed the RottenPotatoes DB with some movies.
more_movies = [
  {:title => 'My Neighbor Totoro', :rating => 'G',
    :release_date => '16-Apr-1988'},
  {:title => 'Green Book', :rating => 'PG-13',
    :release_date => '16-Nov-2018'},
  {:title => 'Parasite', :rating => 'R',
    :release_date => '30-May-2019'},
  {:title => 'Nomadland', :rating => 'R',
    :release_date => '19-Feb-2021'},
  {:title => 'CODA', :rating => 'PG-13',
    :release_date => '13-Aug-2021'},
  {:title => 'Avatar', :rating => 'PG-13',
    :release_date => '10-Dec-2009'},
  {:title => 'Titanic', :rating => 'PG-13',
    :release_date => '01-Nov-1997'},
  {:title => 'The Lion King', :rating => 'G',
    :release_date => '09-Jul-2019'},
]

more_movies.each do |movie|
  # Ensure no duplicates when seeding database
  Movie.find_or_create_by(movie)
end
