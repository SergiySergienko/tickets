module Storages
  module ActiveRecord
    module Repositories
      class User
        include Storages::RepositoryInterface
        
        class << self
          def find_by(*args)
            Storages::ActiveRecord::Models::User.find_by(*args)
          end

          def create(entity_attrs)
            Storages::ActiveRecord::Models::User.create(entity_attrs)
          end

          def all
            Storages::ActiveRecord::Models::User.all
          end

          def authenticate(entity, password)
            entity.authenticate(password)
          end
        end

      end
    end
  end
end
