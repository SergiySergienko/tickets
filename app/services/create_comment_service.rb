#
# Comment creation service
# expecting repository
# as parameters
#
class CreateCommentService < BaseProcessor
  
  protected

  def get_mailer
    CommentMailer
  end
  
  def get_chain
    Processor::Task::ConvertToInstance.new(
      Processor::Task::Validate.new(
        Processor::Task::PushToStore.new(
          Processor::Task::Comment::SendEmail.new(nil, get_mailer), 
          current_repository)
        ), 
      current_repository)
  end

end