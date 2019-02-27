#
# Entity creation process flow base class
#
#
class BaseProcessor
  attr_reader :current_repository
  
  #
  # Constructor
  #
  # @param repository
  #
  def initialize(repository)
    @current_repository = repository
  end

  #
  # Process method
  #
  # @param entity_attrs Entity attributes hash
  #
  # @return Entity processed by repository class
  #
  def process(entity_attrs)
    get_chain.run(entity_attrs)
  end

  protected

  def get_chain    
    raise "get_chain method sould be implemented"
  end

end