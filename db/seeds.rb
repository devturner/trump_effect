# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'json'

Tweet.delete_all

# Dir.glob('db/data_source/*.json') do |raw_tweets|

# raw_tweets = File.read('db/data_source/master_2015.json')
# raw_tweets = File.read('db/data_source/master_2016.json')
# raw_tweets = File.read('db/data_source/master_2017.json')

	@data = []

	# tweets = JSON.parse (raw_tweets)

	tweets = Dir['db/data_source/*.json'].map { |f| JSON.parse File.read(f) }.flatten

# pry

	tweets.map { |tweet|
		if tweet["full_text"] == nil
			tweet["full_text"] = tweet["text"]
		end
		object = {
					"from_user_id":        tweet["user"]["id"],
					"from_user_name":      tweet["user"]["name"],
					"tweet_url":           "https://twitter.com/i/web/status/#{tweet["id_str"]}",
					"tweet_full_text":     tweet["full_text"] ,
					"tweet_created_at":    tweet["created_at"]
		}
		@data << object
	}
	# pry

  Tweet.create!(@data)
# end