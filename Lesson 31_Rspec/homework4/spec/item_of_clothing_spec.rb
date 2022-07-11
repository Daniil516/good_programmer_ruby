require "rspec"
require_relative "../lib/item_of_clothing"

describe ItemOfClothing do

  let(:item) { ItemOfClothing.new("winter hat", "headdress", "(-30, 0)") }

  describe "#new" do
    it 'should return ItemOfClothing object' do
      expect(item).to be_an_instance_of ItemOfClothing
    end

    it 'should return correct name' do
      expect(item.name).to eql "winter hat"
    end

    it 'should return correct type' do
      expect(item.type).to eql "headdress"
    end

    it 'should return range from temperature ' do
      expect(item.temperature).to eql(-30..0)
    end
  end

  describe ".to_s" do
    it 'should return correct string' do
      expect(item.to_s).to eql "winter hat (headdress) -30..0"
    end
  end
end