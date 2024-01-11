class UsersController < AuthenticatedController


    def new
      @user = User.new
    end
  
    def create
      @user = User.new(user_params)
  
      if @user.save
        session[:user_id] = @user.id
        redirect_to root_url, notice: 'User was successfully created.'
      else
        render :new
      end
    end
  
    private
  
    def user_params
      params.require(:user).permit(:username, :password, :password_confirmation)
    end
  end