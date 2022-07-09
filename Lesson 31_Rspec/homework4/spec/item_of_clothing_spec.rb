require "rspec"
require_relative "../lib/item_of_clothing"

describe ItemOfClothing do

  before :all do
    @item_of_clothing = ItemOfClothing.new("winter hat", "headdress", "(-30, 0)")
  end

  describe "#new" do
    it 'should return ItemOfClothing object' do
      @item_of_clothing.should be_an_instance_of ItemOfClothing
    end

    it 'should return correct name' do
      @item_of_clothing.name.should eql "winter hat"
    end

    it 'should return correct type' do
      @item_of_clothing.type.should eql "headdress"
    end

    it 'should return range from temperature ' do
      @item_of_clothing.temperature.should eql(-30..0)
    end
  end

  describe ".to_s" do
    it 'should return correct string' do
      @item_of_clothing.to_s.should eql "winter hat (headdress) -30..0"
    end
  end
end