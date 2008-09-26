class CreateTweets < ActiveRecord::Migration
  def self.up
    create_table :tweets do |t|
      # Values from Twitter
      t.integer     :twitter_id, :null => false       # twitter's ID for this tweet
      t.timestamp   :tweeted_at, :null => false       # when this tweet was posted
      t.string      :text, :null => false             # the text of this tweet
      t.string      :source                           # the application source of this tweet
      t.integer     :in_reply_to                      # which tweet this was in reply to
      
      # Parsed values
      t.integer     :rating                           # a 1-5 star rating
      t.float       :cost                             # cost (currently USD only) 
      
      # Foreign keys
      t.integer     :author_id, :null => false        # author ID for this tweet
      
      # Process info
      t.boolean     :retweeted, :default => false     # whether or not this tweet has been retweeted

      t.timestamps
    end
  end

  def self.down
    drop_table :tweets
  end
end
