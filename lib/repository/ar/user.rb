#
# User Repository class
# includes user-specific calls to AR ORM
#
module Repository
  module AR
    class User < Base

      protected

      def self.current_model
        AR::Models::User
      end

    end
  end
end
