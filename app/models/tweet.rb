class Tweet < ActiveRecord::Base
  # attr_accessor :tweet_id
  validates :tweet_id, uniqueness: true, on: :create

    def self.get_latest_trump_tweets
      x = TwitterAPI.new.client
      x.user_timeline('realDonaldTrump', count: 200).each do | tweet_results |
        # unless validates_uniqueness_of tweet_results.id :scope => :tweet_id
          Tweet.create({
            "from_user_id":        tweet_results.user.id,
            "from_user_name":      tweet_results.user.name,
            "tweet_url":           "https://twitter.com/i/web/status/#{tweet_results.id_str}",
            "tweet_full_text":     tweet_results.full_text,
            "tweet_created_at":    tweet_results.created_at,
            "tweet_id":            tweet_results.id
          })
      end
    end

end