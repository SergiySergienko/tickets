module Repository
  module AR
    class Base
      include Repository::RepositoryInterface
      
      class << self
        
        def find_by(*args)
          current_model.find_by(*args)
        end

        def create(entity)
          entity.save
          entity
        end

        def prepare_new(*args)
          current_model.new(*args)
        end

        def all
          current_model.all
        end

        protected

          def current_model
            raise "class menthod 'current_model' should be implemented in #{name} class"
          end

      end
    end
  end
end