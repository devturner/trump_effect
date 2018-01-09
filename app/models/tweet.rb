class Tweet < ApplicationRecord

	def self.get_latest_trump_tweets

		x = TwitterAPI.new.client
		x.user_timeline('realDonaldTrump', count: 200).each do | tweet_results |
			# pry

		#parsing the string 'created_at' to DateTime object
      # @twitter_created_at = tweet_results.created_at
      @tweet = tweet_results.to_h
		#making sure we are not saving exact same tweet from a person again 
		# unless Tweet.exists?(['@twitter_created_at = ?', tweet_results.created_at])
		@tweet_url = "https://twitter.com/i/web/status/#{@tweet[:id_str]}"
		puts tweet_results["user"]["id"]
		unless Tweet.where([:tweet_url =>  @tweet_url]).exists?
		pry
		#finally creating the tweet record
        Tweet.create!({
        	"from_user_id":        tweet_results["user"]["id"],
        	"from_user_name":      tweet_results["user"]["name"],
        	"tweet_url":           "https://twitter.com/i/web/status/#{tweet_results["id_str"]}",
        	"tweet_full_text":     tweet_results["full_text"],
        	"tweet_created_at":    tweet_results["created_at"]
        })
      end
    end
	end

end