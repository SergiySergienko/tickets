#
# Enquiry Repository class
# includes enquiry-specific calls to AR ORM
#
module Repository
  module AR
    class Enquiry < Base

      protected

      def self.current_model
        AR::Models::Enquiry
      end
      
    end
  end
end
