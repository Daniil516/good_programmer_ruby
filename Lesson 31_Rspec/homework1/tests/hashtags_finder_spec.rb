require "rspec"
require_relative "../lib/hashtags_finder"

describe HashTagsFinder do
  it "returns one hashtag"  do
    expect(HashTagsFinder.find_hashtags("I like play #football")).to eq %w[#football]
  end

  it "returns multiple hashtags"  do
    expect(HashTagsFinder.find_hashtags("I like #play #football")).to eq %w[#play #football]
  end

  it "returns hashtag with underscore"  do
    expect(HashTagsFinder.find_hashtags("I like #play_football")).to eq %w[#play_football]
  end

  it "returns hashtag with several underscores"  do
    expect(HashTagsFinder.find_hashtags("I like #_play_football_")).to eq %w[#_play_football_]
  end

  it "returns hashtag with minuses"  do
    expect(HashTagsFinder.find_hashtags("I like #-play-football-")).to eq %w[#-play-football-]
  end

  it "doesn't returns hashtag with \"?\" "  do
    expect(HashTagsFinder.find_hashtags("I like #?play-football-")).to eq %w[]
  end

  it "doesn't returns hashtag with \"!\" "  do
    expect(HashTagsFinder.find_hashtags("I like #!play-football-")).to eq %w[]
  end

end