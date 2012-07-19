class ContactUsMailer < ActionMailer::Base

  default :to => "alan@aetistry.com", :subject => "Contact From Website"

  def send_confirmation(message)
    @message = message
    @to_address  = 'webmaster@countyofbranch.com'
    unless @message.department_id.nil?
      @dept=Department.find(@message.department_id)
      @to_address= @dept.dept_email.nil? ? 'webmaster@countyofbranch.com' : @dept.dept_email
    end
    mail(:to => @to_address, :from => @message.email ) do |format|
      format.text
    end
  end
end