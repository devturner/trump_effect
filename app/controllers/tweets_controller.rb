class TweetsController < ApplicationController

	def index
	end

	def self.create
		@tweets = Tweet.new(params[:tweets])
		
		@twitter_request = CreateTwitterReport.new(tweets_params).call
	end

end
