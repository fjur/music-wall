class User < ActiveRecord::Base
  
  has_many :songs
  has_many :votes
  has_one :review


end