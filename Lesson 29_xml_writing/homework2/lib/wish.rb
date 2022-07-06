class Wish
  def initialize(xml_wish)
    @date = Date.parse(xml_wish.attributes["date"])
    @text = xml_wish.text.strip
  end

  def fulfilled?
    true if @date < DateTime.now
  end

  def to_s
    "#{@date}: #{@text}"
  end
end