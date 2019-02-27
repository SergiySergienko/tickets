#
# User authorization service
#
class AuthService

  def self.authorize(entity, password)
    entity.authenticate(password)
  end
  
end