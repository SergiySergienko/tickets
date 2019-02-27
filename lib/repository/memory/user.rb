module Repository
  module Memory
    class User < Base

      class << self
        
        protected

        def current_model
          ::User
        end
      end

    end
  end
end