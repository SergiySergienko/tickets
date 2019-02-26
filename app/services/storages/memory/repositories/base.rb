module Storages
  module Memory
    module Repositories
      class Base
        include Storages::RepositoryInterface

        class << self
          def find_by(*args)
            conditions = args.first
            filtered_collection = all.select do |user|
              conditions.map { |key, value| (user.respond_to?(key) && (user.send(key) == value)) }.all?(true)
            end  
            filtered_collection.try(:first)
          end

          def create(entity_attrs)
            entity = prepare_new(entity_attrs)
            Storages::MemoryStorage.instance.add_to_storage(entity) if entity.valid?
          end

          def all
            Storages::MemoryStorage.instance.get_collection(current_model)
          end

          def prepare_new(*args)
            current_model.new(*args)
          end

          protected

          def current_model
            raise "'current_model' method should be implemented"
          end
        end

      end
    end
  end
end