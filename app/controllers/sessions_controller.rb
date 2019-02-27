class SessionsController < ApplicationController
  before_action :set_manager
  
  # Sign in form render
  def new
  end
  
  # Just for test
  def add_test_user
    @manager.create({id: 1, email: 'test@test.com', password: '123', password_confirmation: '123'})
    redirect_to login_path
  end

  # Sign in action
  def create
    user = @manager.find_by(email: user_params[:email])
    
    # Authenticate user
    if user && AuthService.authorize(user, user_params[:password])
      # Save the user.id in that user's session cookie:
      session[:user_id] = user.id.to_s
      redirect_to enquiries_path, notice: 'Successfully logged in!'
    else
      # if email or password incorrect, re-render login page:
      flash.now.alert = "Incorrect email or password, try again."
      render :new
    end
  end

  # Sign out action
  def destroy
    session.delete(:user_id)
    redirect_to login_path, notice: "Logged out!"
  end

  private

  #
  # Prepare repository for current controller actions
  # example:
  # @manager = Repository::AR::User - to work with User repository
  # with ActiveRecord implementation
  # @manager = Repository::Memory::User - to work with User repository
  # with Memory Storage implementation
  #
  # @return manager
  #
  def set_manager
    @manager ||= Repository::AR::User
  end

  def user_params
    params.require(:login).permit(:email, :password, :password_confirmation)
  end

end
