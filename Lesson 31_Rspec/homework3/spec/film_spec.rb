require_relative "../lib/film"
require "rspec"

describe Film do
  before :all do
    @film = Film.new("Back to the future", "Robert Zemeckis", 1985)
  end

  describe "#new" do
    it 'should be a Film instance' do
      @film.should be_an_instance_of Film
    end

    it 'should return correct film_name' do
      @film.film_name.should eql "Back to the future"
    end

    it 'should return correct film_director' do
      @film.director.should eql "Robert Zemeckis"
    end

    it 'should return correct year' do
      @film.year.should eql 1985
    end
  end
end