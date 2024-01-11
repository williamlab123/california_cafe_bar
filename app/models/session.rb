class Session < ApplicationRecord
  def destroy
    reset_session
    redirect_to root_url, notice: 'Logged out successfully!'
  end
end
