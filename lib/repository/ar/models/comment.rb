#
# ActiveRecord Comment model
#
module Repository::AR::Models
  class Comment < ApplicationRecord
    self.table_name = "comments"
 
    validates :enquiry_id, :message, presence: true
  end
end
