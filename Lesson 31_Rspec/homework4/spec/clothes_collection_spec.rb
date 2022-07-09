require "rspec"
require_relative "../lib/clothes_collection"
require_relative "../lib/item_of_clothing"

describe ClothesCollection do
  before "#new" do
    @instance = ClothesCollection.new("some_clothes")
  end

  before :all do
    @clothes_collection = ClothesCollection.from_dir("#{__dir__}/fixtures")
  end

  describe "#new" do
    it "should return ClothesCollection instance" do
      @instance.should be_an_instance_of ClothesCollection
    end
  end

  describe ".from_dir" do

    it "object in array should be of ItemOfClothing class" do
      @clothes_collection.clothes.sample.should be_an_instance_of ItemOfClothing
    end

    it "should return correct array size" do
      @clothes_collection.clothes.length.should eql 13
    end
  end

  describe ".for_weather" do
    describe "should return clothes in acceptable temperature " do
      it "clothes range should include 25 degrees" do
        test_arg = 25
        @clothes_collection.for_weather(test_arg).each do |item|
          expect(item.temperature).to include(test_arg)
        end
      end

      it "clothes range should include -15 degrees" do
        test_arg = -15
        @clothes_collection.for_weather(test_arg).each do |item|
          expect(item.temperature).to include(test_arg)
        end
      end

      it "clothes range should include 5 degrees" do
        test_arg = 5
        @clothes_collection.for_weather(test_arg).each do |item|
          expect(item.temperature).to include(test_arg)
        end
      end

      it "clothes range should NOT include 60 degrees" do
        test_arg = 60
        @clothes_collection.for_weather(test_arg).each do |item|
          expect(item.temperature).to_not include(test_arg)
        end
      end
    end
  end

end