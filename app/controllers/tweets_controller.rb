class TweetsController < ApplicationController
  layout "standard"
  
  def list
  end

  def search
  end

  def index
    @tweets = Tweet.find(:all, :order => "tweeted_at DESC", :limit => 15)
  end
end
