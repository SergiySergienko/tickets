module Repository
  module Memory
    class User < Base

      class << self
        
        def authenticate(entity, password)
          entity.authenticate(password)
        end

        protected

        def current_model
          ::User
        end
      end

    end
  end
end