# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'json'

Tweet.delete_all

	@data = []

	tweets = Dir['db/data_source/*.json'].map { |f| JSON.parse File.read(f) }.flatten

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

  Tweet.create!(@data)
  