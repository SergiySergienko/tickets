module Storages
  class MemoryStorage
    include Singleton
    include Storages::ConcreteStorageInterface

    def initialize
      @collection = {}
    end
    
    def get_collection(entity)
      @collection[get_key(entity)] || []
    end

    def add_to_storage(entity)
      section_name_key = get_key(entity)
      @collection[section_name_key] = [] unless @collection.has_key?(section_name_key)
      @collection[section_name_key] << entity
      entity
    end

    private

    def get_key(entity)
      entity.to_s.downcase.to_sym
    end

  end
end