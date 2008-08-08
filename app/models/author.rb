class Author < ActiveRecord::Base
  has_many :tweets
end
