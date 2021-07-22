require "mail"
require "rss"
require "erb"
require "open-uri"
require "dotenv/load"
require_relative "./lib/interactors/posts_parser.rb"
require_relative "./config/mail.rb"
require_relative "./lib/mailers/feed.rb"

sources = YAML.load_file('./config/sources.yaml')
posts = PostsParser.new.parse(sources)
Feed.new.deliver!(posts: posts)
