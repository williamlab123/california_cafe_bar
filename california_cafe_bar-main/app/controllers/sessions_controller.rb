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
    
    if user&.authenticate(session_params[:password])
      session[:user_id] = user.id
      Rails.logger.debug "Flash message: Login realizado com sucesso!"
      redirect_to root_url, notice: 'Login realizado com sucesso!'
    else
      flash.now[:alert] = 'Combinação de nome de usuário/senha inválida'
      Rails.logger.debug "Flash alert: #{flash.now[:alert]}"
      render :new
    end
    
  end
  
  private
  
  def session_params
    params.require(:session).permit(:username, :password)
  end
  
  def destroy
    if @current_user
      reset_session
      redirect_to login_path, notice: 'Logged out successfully!'
    else
      redirect_to login_path, notice: 'No user logged in'
    end
  end

  private

  def session_params
    params.require(:session).permit(:username, :password)
  end
end
