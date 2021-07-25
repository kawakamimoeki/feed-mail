require 'date'

class PostsParser
  def initialize(parser = RSS::Parser)
    @parser = parser
  end

  def parse(channels)
    posts = []

    channels.each do |channel|
      rss = @parser.parse(URI.open(channel).read)
      items = rss.items.filter do |item|
        !item.methods.include?(:pubDate) || item.pubDate.to_date == Date.today
      end
      posts += items
    end

    posts.shuffle
  end
end
