class HashTagsFinder
  def self.find_hashtags(sentence)
    sentence.scan(/#[[:word:]\-]+/)#.scan to print matches
  end
end