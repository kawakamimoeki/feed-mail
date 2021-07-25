require "mail"
require "rss"
require "erb"
require "open-uri"
require "dotenv/load"
require_relative "./lib/interactors/posts_parser.rb"
require_relative "./config/mail.rb"
require_relative "./lib/mailers/feed.rb"

channels = YAML.load_file('./config/channels.yaml')
posts = PostsParser.new.parse(channels)
Feed.new.deliver!(posts: posts)
