class CommentMailer < ApplicationMailer
  
  def new_comment(enquiry, comment)
    @enquiry = enquiry
    @comment = comment
    mail(to: "#{enquiry.name} #{enquiry.email}", subject: "New enquiry reply")
  end
end