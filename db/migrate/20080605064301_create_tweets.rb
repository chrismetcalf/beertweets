class CreateTweets < ActiveRecord::Migration
  def self.up
    create_table :tweets do |t|
      t.integer :twitter_id, :null => false     # twitter's ID for this tweet
      t.timestamp :created_at                   # when this tweet was posted
      t.string :text, :null => false            # the text of this tweet
      t.string :source                          # the application source of this tweet
      t.integer :rating                         # a 1-5 star rating

      t.integer :author_id, :null => false      # author ID for this tweet

      t.timestamps
    end
  end

  def self.down
    drop_table :tweets
  end
end
