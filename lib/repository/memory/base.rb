#
# Memory Repository Base class
# this class know how to work with MemoryStorage interface
#
module Repository
  module Memory
    class Base
      include Repository::RepositoryInterface

      class << self
        def find_by(*args)
          filter_by(*args).try(:firsts)
        end

        def create(entity_attrs)
          entity = prepare_new(entity_attrs)
          Storages::MemoryStorage.instance.add_to_storage(entity) if entity.valid?
          entity
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
          raise "'current_model' method should be implemented"
        end
      end
    end
  end
end