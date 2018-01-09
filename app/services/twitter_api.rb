class TwitterAPI
	

  def client
  	@twitter_config_path = Rails.root.join('config/twitter.yml').to_s
  	if File.exist?(@twitter_config_path)
    	twitter_config = YAML.load_file(@twitter_config_path).with_indifferent_access

	    @twitter_client = Twitter::REST::Client.new do |config|
	      config.consumer_key        = twitter_config[:consumer_key]
	      config.consumer_secret     = twitter_config[:consumer_secret]
	      config.access_token        = twitter_config[:oauth_token]
	      config.access_token_secret = twitter_config[:oauth_token_secret]
		end
    else
      puts (%Q(Twitter configuration not found! No file at "#{config_path}".))
  	end
	end
	
end