class CommentMailer < ApplicationMailer
  
  def new_comment(comment, enquiry)
    @comment = comment
    @enquiry = enquiry
    mail(to: "#{enquiry.name} #{enquiry.email}", subject: "New enquiry reply")
  end
end