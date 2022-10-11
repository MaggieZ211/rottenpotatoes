class Movie < ActiveRecord::Base
  def self.find_movies_with_same_director(id)
    self.where(director: Movie.find(id).director)
  end
end
