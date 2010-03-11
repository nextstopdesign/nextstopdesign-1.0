class Emailer < ActionMailer::Base
  
  def registration_confirmation(to_name, to_email, username, password)
    
    sent_on Time.now
    from "Next Stop Design <nextstopdesign@gmail.com>"
    bcc ["mike@backwardm.com", "New User <nextstopdesign@gmail.com>"]
    recipients to_email

    subject "Next Stop Design Registration Confirmation"
    body :to_name => to_name, :username => username, :password => password
    content_type "multipart/alternative"
              
  end
  
  def verification_email(first_name, to_email, verification_code)
    
    sent_on Time.now
    from "Next Stop Design <nextstopdesign@gmail.com>"
    bcc ["mike@backwardm.com", "New User <nextstopdesign@gmail.com>"]
    recipients to_email

    subject "Next Stop Design New User Verification"
    body :first_name => first_name, :verification_code => verification_code
    content_type "multipart/alternative"
              
  end
  
  
  def forgot_username_password(to_name, to_email, username, password)
    
    sent_on Time.now
    from "Next Stop Design <nextstopdesign@gmail.com>"
    recipients to_email

    subject "Next Stop Design Username & Password Reminder"
    body :to_name => to_name, :username => username, :password => password
    content_type "multipart/alternative"
              
  end
  

end
