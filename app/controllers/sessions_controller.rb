class SessionsController < ApplicationController
  def new
    # Display login form
  end

  def create
    Rails.logger.debug "Processing SessionsController#create"
    Rails.logger.debug "Params: #{params.inspect}"
  
    user = User.find_by(username: session_params[:username])
  
    if user
      Rails.logger.debug "Found user: #{user.inspect}"
    else
      Rails.logger.debug "No user found with username: #{session_params[:username]}"
    end
  
    if user && user.authenticate(session_params[:password])
      session[:user_id] = user.id
      redirect_to root_url, notice: 'Logged in successfully'
    else
      flash.now[:alert] = 'Invalid username/password combination'
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to root_url, notice: 'Logged out successfully!'
  end

  private

  def session_params
    params.require(:session).permit(:username, :password)
  end
end
