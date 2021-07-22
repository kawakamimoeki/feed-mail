require 'date'

class PostsParser
  def initialize(parser = RSS::Parser)
    @parser = parser
  end

  def parse(sources)
    posts = {}

    sources.each do |category, channels|
      posts[category] = []
      channels.each do |channel|
        rss = @parser.parse(URI.open(channel).read)
        items = rss.items.filter { |item| item.pubDate.to_date == Date.today }
        posts[category] += items
      end
    end

    posts
  end
end
