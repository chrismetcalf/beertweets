class TweetsController < ApplicationController
  layout "standard"

  def index
    @tweets = Tweet.find(:all, :order => "tweeted_at DESC", :limit => 15)
  end
end
