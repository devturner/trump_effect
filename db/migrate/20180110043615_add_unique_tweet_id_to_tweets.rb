class AddUniqueTweetIdToTweets < ActiveRecord::Migration[5.1]
  def change
  	add_column :tweets, :tweet_id, :bigint, unique: true
  end
end
