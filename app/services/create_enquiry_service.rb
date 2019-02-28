#
# Enquiry creation service
# expecting reference ID generator and repository
# as parameters
#
class CreateEnquiryService
  attr_reader :current_ref_id_service, :current_repository
  
  #
  # Constructor
  #
  # @param ref_id_service this service sohould has generate_id method 
  # @param repository
  #
  def initialize(ref_id_service, repository)
    @current_ref_id_service = ref_id_service
    @current_repository = repository
  end

  def process(entity_attrs)
    entity_attrs.merge!({ ref_id: current_ref_id_service.generate_id })
    entity = current_repository.prepare_new(entity_attrs)
    return entity unless entity.valid?
    entity = current_repository.create(entity)
    EnquiryMailer.new_enquiry_confirmation(entity).deliver
    entity
  end

end