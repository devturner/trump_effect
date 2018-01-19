ENV['RAILS_ENV'] = "development"

every 5.minutes do
  runner "Tweet.get_latest_trump_tweets"
end
