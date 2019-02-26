module Storages::ActiveRecord::Models
  class Comment < ApplicationRecord
    self.table_name = "comments"
  end
end
