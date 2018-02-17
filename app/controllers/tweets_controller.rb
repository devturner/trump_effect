class TweetsController < ApplicationController

	def index
		@tweets = Tweet.all
	end

	def self.create
		@tweets = Tweet.new(params[:tweets])
		
		@twitter_request = CreateTwitterReport.new(tweets_params).call
	end

end
