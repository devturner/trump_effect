

#Twitter report class

class CreateTwitterReport

def initialize(params)
	@tweets
	@number_of_tweets
	@created_times = Array.new
end

def call
  get_tweets(@number_of_tweets)
  tweet_times(@tweets)
  fix_times(@created_times)
end

private

def get_tweets(quantity)
	@tweets = @twitter_client.user_timeline('realDonaldTrump', count: @number_of_tweets)
end

def tweet_times(collected_tweets)
	@created_times = @tweets.map { |tweet| tweet.created_at }
end

def fix_times(tweet_times)
	@corrected_times = Array.new
	for i in @created_times
		i = i.floor_to(1*60) + Time.now.in_time_zone('America/New_York').utc_offset
		@corrected_times << i
	end
	# market_times(@corrected_times)
end


end