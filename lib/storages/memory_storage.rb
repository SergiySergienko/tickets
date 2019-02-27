#
# Simple in-memory storage
# saving entities in hash of arrays
# using entity class as collection key
#
module Storages
  class MemoryStorage
    include Singleton
    include Storages::ConcreteStorageInterface

    def initialize
      @collection = {}
    end
    
    #
    # Get collection by entity type
    #
    # @param entity class
    #
    # @return collection array
    #
    def get_collection(entity)
      @collection[get_key(entity)] || []
    end

    #
    # Push entity to storage
    #
    # @param entity
    #
    # @return entity
    #
    def add_to_storage(entity)
      section_name_key = get_key(entity)
      @collection[section_name_key] = [] unless @collection.has_key?(section_name_key)
      @collection[section_name_key] << entity
      entity
    end

    private

    #
    # get collection key name
    #
    # @param entity
    #
    # @return key name string
    #
    def get_key(entity)
      entity.to_s.downcase.to_sym
    end

  end
end