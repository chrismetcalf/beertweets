#!/usr/bin/env ruby
# Pull down replies and load them in the DB

require 'rubygems'
require 'rest-open-uri'
require 'rexml/document'

def get_replies(username, password)
  # Make the HTTPS request
  response = open('http://twitter.com/statuses/replies.xml',
                  :http_basic_authentication => [username, password])

  # Pull out the XML and turn it into a document
  xml = response.read
  document = REXML::Document.new(xml)

  # For each tweet, store it away
  REXML:XPath.each(document, '/statuses/status') do |e|
    t_id = e.elements["id"].text
    # Check to see if we've encountred this tweet before
    t = Tweet.find(:first, :conditions => "twitter_id = #{t_id}")
    if t != nil
      # Skip it
      continue
    end
    # Hasn't been loaded yet
    t.twitter_id = t_id
    t.created_at = nil # FIXME
    t.text = e.elements["text"].text
    t.source = e.elements["source"].text
    # TODO parse out rating
    t.rating = nil

    # Deal with the author
    user = a.elements["user"]
    user_id = user["id"].text
    if a == nil
      # New author. Create them
      a = Author.new
    end

    # Whether they're new or not we update their record
    a.twitter_id = user_id
    a.screen_name = user["screen_name"].text
    a.name = user["name"].text
    a.description = user["description"].text
    a.url = user["url"].text
    a.location = user["location"].text
    a.image_url = user["image_url"].text

    # Map this author to the tweet
    t.author = a

    # Push them to the DB
    a.save
    t.save

    # TODO Re-tweet!
  end
end

username, password = ARGV
get_replies(username, password)
