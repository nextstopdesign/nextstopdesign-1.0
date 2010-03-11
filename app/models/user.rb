class User < ActiveRecord::Base

  validates_presence_of :first_name, :last_name, :city, :state, :country, :email, :username, :password
  validates_length_of :username, :within => 5..20
  validates_length_of :password, :within => 5..20
  validates_uniqueness_of :username, :email
  validates_confirmation_of :email
  validates_format_of :email, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i, :message => "Invalid email"

  has_many :designs
  has_many :ideas
  has_many :comments
  
  def self.authenticate(username, password)
    
    u=find(:first, :conditions=>["username = ? AND password = ? AND verified = 1", username, password])
    
    if u.nil?   
      return 0
    else
      return u.id
    end

    nil
  
  end
  
  def self.verify(verification_code)
    
    u=find(:first, :conditions=>["verification_code = ?", verification_code])
    
    if u.nil?
      return 0
    else
      u.update_attribute(:verified,1)
      return u.id
    end
    nil
  end
  
  
end
