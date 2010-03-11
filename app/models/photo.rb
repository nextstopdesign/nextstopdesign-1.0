class Photo < ActiveRecord::Base

  has_attached_file :photo, :styles => { :large => "940x940>", :email => "600x600>", :thumb => "200x200>", :tiny => "100x100>" },
            :url => "/images/inspiration/:style/:basename.:extension",
            :path => ":rails_root/public/images/inspiration/:style/:basename.:extension"

  acts_as_list
  
  validates_attachment_content_type :photo,
      :content_type => ['image/jpg', 'image/jpeg', 'image/pjpeg', 'image/gif', 'image/png', 'image/x-png'],
      :message => "only image files are allowed, no PDFs please."
      
  validates_attachment_size :photo,
      :less_than => 2.megabytes, #another option is :greater_than
      :message => "max size per image is 2 MB. Please downsize your file and try again."
  
  

end