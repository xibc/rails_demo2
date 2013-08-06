require 'spec_helper'

describe Movie do

  describe ".find_by_title" do
    it "should not return empty for title 'Hobbit'" do
      movie = Movie.find_by_title('Hobbit').first
      movie.should_not be_nil
    end

    it "should find the right movie" do
      movie = Movie.find_by_title('Hobbit').first
      movie.title.should eq 'The Hobbit: An Unexpected Journey'
    end
  end

end

