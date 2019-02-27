#
# Storage interface module
# To implement your custom storage or 
# integrates with existing one, please use this interface
#
module Storages
  module ConcreteStorageInterface

    def add_to_storage(entitiy)
      raise "add_to_storage method should be implemented"
    end

    def get_collection
      raise "get_collection method should be implemented"
    end

    def find_by(*args)
      raise "find_by method should be implemented"
    end

  end
end