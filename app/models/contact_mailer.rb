class ContactMailer < ActionMailer::Base
  
  def contact_notification(contact_handler)
    
    recipients   "thall@cityofmarshall.com"
    from         contact_handler.email
    subject      "Job Application to City of Marshall"
    sent_on			Time.now
   
    body				:contact_handler => contact_handler
  end

  def jobapp_confirmation(jobapp)
    
    recipients   jobapp.applicant.email
    from         "thall@cityofmarshall.com"
    subject      "Job Application to City of Marshall - #{jobapp.job.title}"
    sent_on			Time.now
    bcc					["thall@cityofmarshall.com"]
   
    body				:jobapp => jobapp
  end
  
  
  
end