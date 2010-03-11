class Design < ActiveRecord::Base

  belongs_to :user

  validates_presence_of :title, :description, :photo1
  #validates_not_profane :title, :description

  has_attached_file :photo1, :styles => { :large => "940x940>", :email => "600x600>", :thumb => "200x200>", :tiny => "100x100>" },
            :url => "/images/designs/:id/:style/:basename.:extension",
            :path => ":rails_root/public/images/designs/:id/:style/:basename.:extension"

  has_attached_file :photo2, :styles => { :large => "940x940>", :email => "600x600>", :thumb => "200x200>", :tiny => "100x100>" },
            :url => "/images/designs/:id/:style/:basename.:extension",
            :path => ":rails_root/public/images/designs/:id/:style/:basename.:extension"

  has_attached_file :photo3, :styles => { :large => "940x940>", :email => "600x600>", :thumb => "200x200>", :tiny => "100x100>" },
            :url => "/images/designs/:id/:style/:basename.:extension",
            :path => ":rails_root/public/images/designs/:id/:style/:basename.:extension"
  
  #validates_uniqueness_of :photo1_file_name
  #validates_uniqueness_of :photo2_file_name, :allow_blank => true
  #validates_uniqueness_of :photo3_file_name, :allow_blank => true
  
  acts_as_rateable
  acts_as_commentable
  acts_as_list
  
  validates_attachment_presence :photo1
  
  validates_attachment_content_type :photo1,
      :content_type => ['image/jpg', 'image/jpeg', 'image/pjpeg', 'image/gif', 'image/png', 'image/x-png'],
      :message => "only image files are allowed, no PDFs please."
      
  validates_attachment_size :photo1,
      :less_than => 2.megabytes, #another option is :greater_than
      :message => "max size per image is 2 MB. Please downsize your file and try again."

  validates_attachment_content_type :photo2,
      :content_type => ['image/jpg', 'image/jpeg', 'image/pjpeg', 'image/gif', 'image/png', 'image/x-png'],
      :message => "only image files are allowed, no PDFs please."

  validates_attachment_size :photo2,
      :less_than => 2.megabytes, #another option is :greater_than
      :message => "max size per image is 2 MB. Please downsize your file and try again."

  validates_attachment_content_type :photo3,
      :content_type => ['image/jpg', 'image/jpeg', 'image/pjpeg', 'image/gif', 'image/png', 'image/x-png'],
      :message => "only image files are allowed, no PDFs please."

  validates_attachment_size :photo3,
      :less_than => 2.megabytes, #another option is :greater_than
      :message => "max size per image is 2 MB. Please downsize your file and try again."
  
  def to_param
    "#{id}-#{title.gsub(/[^a-z1-9]+/i, '-')}"
  end

end
