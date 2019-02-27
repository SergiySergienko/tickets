#
# Memory Repository Base class
# this class know how to work with MemoryStorage service
#
module Repository
  module Memory
    class Base
      include Repository::RepositoryInterface

      class << self
        def find_by(*args)
          filter_by(*args).try(:firsts)
        end

        def create(entity)
          Storages::MemoryStorage.instance.add_to_storage(entity)
        end

        def all
          Storages::MemoryStorage.instance.get_collection(current_model)
        end

        def prepare_new(*args)
          current_model.new(*args)
        end

        protected

        def filter_by(*args)
          conditions = args.first
          filtered_collection = all.select do |entity|
            conditions.map { |key, value| (entity.respond_to?(key) && (entity.send(key) == value)) }.all?(true)
          end  
          filtered_collection
        end

        def current_model
          raise "method 'self.current_model' should be implemented in #{name} class"
        end
      end
    end
  end
end
