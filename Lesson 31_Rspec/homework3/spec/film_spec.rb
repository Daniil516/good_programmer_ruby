require_relative "../lib/film"
require "rspec"

describe Film do
    let(:film) { Film.new("Back to the future", "Robert Zemeckis", 1985) }

  describe "#new" do
    it 'should be a Film instance' do
      expect(film).to be_an_instance_of Film
    end

    it 'should return correct film_name' do
      expect(film.film_name).to eql "Back to the future"
    end

    it 'should return correct film_director' do
      expect(film.director).to eql "Robert Zemeckis"
    end

    it 'should return correct year' do
      expect(film.year).to eql 1985
    end
  end
end