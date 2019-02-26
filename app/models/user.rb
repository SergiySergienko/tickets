class User
  include ActiveModel::Model
  include ActiveModel::SecurePassword

  has_secure_password

  attr_accessor :id, :email, :password_digest
  
  def to_s
    "User"
  end
  
end
