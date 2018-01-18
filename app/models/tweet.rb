class Tweet < ActiveRecord::Base
  # attr_accessor :tweet_id
  validates :tweet_id, uniqueness: true, on: :create

    def self.get_latest_trump_tweets
      client = TwitterAPI.new.client
      client.user_timeline('realDonaldTrump', count: 100, tweet_mode: "extended").each do | tweet_result |
        Tweet.create({
          "from_user_id":        tweet_result.user.id,
          "from_user_name":      tweet_result.user.name,
          "tweet_url":           "https://twitter.com/i/web/status/#{tweet_result.id.to_s}",
          "tweet_full_text":     tweet_result.attrs[:full_text],
          "tweet_created_at":    tweet_result.created_at,
          "tweet_id":            tweet_result.id
        })
      end
    end

end