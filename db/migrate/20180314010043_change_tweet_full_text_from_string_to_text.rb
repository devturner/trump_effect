class ChangeTweetFullTextFromStringToText < ActiveRecord::Migration[5.1]
  def change
  	change_column :tweets, :tweet_full_text, :text
  end
end
