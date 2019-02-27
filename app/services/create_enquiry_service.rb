#
# Enquiry creation service
# expecting reference ID generator and repository
# as parameters
#
class CreateEnquiryService < BaseProcessor
  attr_reader :current_ref_id_service
  
  #
  # Constructor
  #
  # @param ref_id_service this service sohould has generate_id method 
  # @param repository
  #
  def initialize(ref_id_service, repository)
    @current_ref_id_service = ref_id_service
    super(repository)
  end

  protected

  def get_mailer
    EnquiryMailer
  end
  
  def get_chain
    Processor::Task::Enquiry::AssignRefId.new(
      Processor::Task::ConvertToInstance.new(
        Processor::Task::Validate.new(
          Processor::Task::PushToStore.new(
            Processor::Task::Enquiry::SendEmail.new(nil, get_mailer), 
            current_repository)
          ), 
        current_repository), 
      current_ref_id_service)
  end

end