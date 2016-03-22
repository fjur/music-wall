class Review < ActiveRecord::Base

  belongs_to :user
  belongs_to :song

  validates :rating, inclusion: {in: 1..6}

end