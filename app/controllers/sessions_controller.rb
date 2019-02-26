class SessionsController < ApplicationController
  before_action :set_manager
  
  def new
  end
  
  def add_test_user
    # @manager = StorageManager.new(MemoryStorage, Storages::ActiveRecord::Repositories::User)
    # @manager.create({id: 1, email: 'test@test.com', password: '123', password_confirmation: '123'})
    @manager.create({id: 1, email: 'test@test.com', password: '123', password_confirmation: '123'})
    redirect_to login_path
  end

  def create
    # user = @manager.find_by(email: user_params[:email])
    user = @manager.find_by(email: user_params[:email])
    
    # Authenticate user
    # if user && @manager.authenticate(user, user_params[:password])
    if user && @manager.authenticate(user, user_params[:password])
      # Save the user.id in that user's session cookie:
      session[:user_id] = user.id.to_s
      redirect_to enquiries_path, notice: 'Successfully logged in!'
    else
      # if email or password incorrect, re-render login page:
      flash.now.alert = "Incorrect email or password, try again."
      render :new
    end
  end

  def destroy
    # LogOut process
    session.delete(:user_id)
    redirect_to login_path, notice: "Logged out!"
  end

  private

  def set_manager
    @manager ||= Storages::ActiveRecord::Repositories::User
  end

  def user_params
    params.require(:login).permit(:email, :password, :password_confirmation)
  end

end
