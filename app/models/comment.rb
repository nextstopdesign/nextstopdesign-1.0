class Comment < ActiveRecord::Base

  belongs_to :user
  
  validates_presence_of :comment, :message => "You need to supply a comment."
  #validates_presence_of :name, :message => "You need to supply your name."
  #validates_presence_of :location, :message => "Please tell us where you are located."

  def self.search(search)
    if search
      find(:all, :conditions => ['comment LIKE ? OR name LIKE ? OR location LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%" ], :order => "approved, created_at ASC")
    else
      find(:all, :order => "approved, created_at ASC")
    end
  end
  
end