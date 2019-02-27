class EnquiryMailer < ApplicationMailer
  
  def new_enquiry_confirmation(enquiry)
    @enquiry = enquiry
    mail(to: "#{enquiry.name} #{enquiry.email}", subject: "New enquiry notification")
  end
end