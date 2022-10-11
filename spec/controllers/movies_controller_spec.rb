require 'rails_helper'
require 'spec_helper'

describe MoviesController do

  describe "test index" do
    it "should render the index page and show all movies" do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe "test new" do
    it "should render the new page" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "test create" do
    it "should redirect to the index page" do
      post :create, :movie => {:title => "movie-test-123", :rating => "G", :director => "director-test-123"}
      expect(response).to redirect_to(movies_path)
    end
  end

  describe "test delete" do
    it "redirects to the index page" do
      movie1 = Movie.create! :director => "Director 1"
      delete :destroy, :id => movie1.id
      expect(response).to redirect_to movies_path
    end
  end

  describe 'test find movies with same director' do
    it 'should return movies with same director when the specified movie has a director' do
      movie1 = Movie.create! :director => "Director 1"
      movie2 = Movie.create! :director => "Director 1"
      get :find_similar_movies, :id => movie1.id
      expect(response).to render_template(:find_similar_movies)
      puts response
    end

    it "should redirect to home page when the specified movie has no director" do
      movie3 = Movie.create! :director => nil
      get :find_similar_movies, :id => movie3.id 
      expect(response).to redirect_to(movies_path)
    end
  end
end
