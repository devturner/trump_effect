class Tweet < ApplicationRecord

	def self.get_latest_trump_tweets
		@twitter_client.user_timeline('realDonaldTrump', count: 200).each do |tweet_results|

		#parsing the string 'created_at' to DateTime object
      twitter_created_at = DateTime.parse(tweet_results.created_at)

		#making sure we are not saving exact same tweet from a person again 
      unless Tweet.exists?(['twitter_created_at = ? AND from_user_id_str = ?', DateTime.parse(tweet_results.created_at), tweet_results.from_user_id_str])

		#finally creating the tweet record
        Tweet.create!({
        	"from_user_id":        tweet["user"]["id"],
        	"from_user_name":      tweet["user"]["name"],
        	"tweet_url":           "https://twitter.com/i/web/status/#{tweet["id_str"]}",
        	"tweet_full_text":     tweet["full_text"],
        	"tweet_created_at":    tweet["created_at"]
        })
      end
    end
	end

end