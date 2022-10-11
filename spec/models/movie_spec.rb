require 'rails_helper'

describe Movie do
  describe "test find movies by director"  do
    it "should return the correct matches for movies by the same director" do
      movie1 = Movie.create! :director => "Director 1"
      movie2 = Movie.create! :director => "Director 1"
      expect(Movie.find_movies_with_same_director(movie1.id)).to include(movie2)
    end
    it "should not return matches of movies by different directors" do
      movie1 = Movie.create! :director => "Director 1"
      movie2 = Movie.create! :director => "Director 2"
      expect(Movie.find_movies_with_same_director(movie1.id)).to_not include(movie2)
    end
  end
end