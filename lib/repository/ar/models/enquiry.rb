#
# ActiveRecord Enquiry model
#
module Repository::AR::Models
  class Enquiry < ApplicationRecord
    self.table_name = "enquiries"

    validates :name, :subject, :email, :message, :department, presence: true

    def to_param
      ref_id || id.to_s
    end
  end
end
