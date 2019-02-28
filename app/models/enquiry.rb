class Enquiry
  include ActiveModel::Model
  include ActiveModel::Conversion

  attr_accessor :id, :ref_id, :name, :email, :department, :subject, :message
  validates :name, :email, :message, presence: true

  def to_param
    ref_id
  end
  
  def to_s
    "Enquiry"
  end

end
