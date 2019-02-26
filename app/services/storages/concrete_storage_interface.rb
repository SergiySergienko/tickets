module Storages
  module ConcreteStorageInterface

    def add_to_storage(entitiy)
      raise "create method should be implemented"
    end

    def get_collection
      raise "get_all method should be implemented"
    end

    def get_by_id(id)
      raise "get_by_id method should be implemented"
    end

    def find_by(*args)
      raise "find_by method should be implemented"
    end

  end
end