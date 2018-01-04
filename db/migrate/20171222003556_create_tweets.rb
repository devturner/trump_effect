class CreateTweets < ActiveRecord::Migration[5.1]
  def change
    create_table :tweets do |t|
      t.integer :from_user_id, :limit => 8
      t.string :from_user_name
      t.string :tweet_url
      t.longtext :tweet_full_text
      t.datetime :tweet_created_at

      t.timestamps
    end
  end
end
