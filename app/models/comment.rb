class Comment
  include ActiveModel::Model

  attr_accessor :enquiry_id, :message
  validates :enquiry_id, :message, presence: true

  def to_s
    "Comment"
  end
end
