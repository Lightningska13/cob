class ContactUsController < ApplicationController
  before_filter :require_user, :except => [:new, :create]
	
  def new
    # Need to email department if they have an email, otherwise email webmaster
    unless params[:id].nil?
      @department = Department.find(params[:id])
      @contacts = Department.get_contacts(@department)
    end
    @contact_us = ContactUs.new
  	@page_title = "Contact Us"
  end

  def create
    @contact_us = ContactUs.new(params[:contact_us])
  	@page_title = "Contact  #{SITE_NAME}"

    if @contact_us.valid?
      ContactUsMailer.send_confirmation(@contact_us).deliver
      flash[:notice] = 'Thank you. Your message has been sent.'
      redirect_to get_redirect(@contact_us.department_id)
    else
      render :action => "new"
    end
  end
  
  protected
  
  def get_redirect(dept)
    if dept.nil?
      root_path
    else
      department_path(dept)
    end
  end
end