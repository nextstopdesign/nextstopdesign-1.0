class Idea < ActiveRecord::Base

  belongs_to :user

  validates_presence_of :idea
  validates_not_profane :idea
  
  acts_as_rateable
  acts_as_commentable
  acts_as_list
  
end