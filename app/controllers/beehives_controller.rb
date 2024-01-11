class BeehivesController < AuthenticatedController
  def create
    @beehive_group = BeehiveGroup.new(beehive_group_params)
    @beehive_group.user = User.find(session[:user_id]) if session[:user_id]
    if @beehive_group.save
      redirect_to beehive_group_url
    else
      puts @beehive_group.errors.full_messages
      render :new
    end
  end

  def index
    @beehive_groups = BeehiveGroup.where(user_id: session[:user_id])
    @honey_amounts = @beehive_groups.map { |beehive_group| beehive_group.calculate_honey_amount }
  end

  def new
    @beehive_group = BeehiveGroup.new
  end

  def destroy
    @beehive_group = BeehiveGroup.find(params[:id])
    @beehive_group.destroy
    redirect_to beehive_groups_url
  end

  private

  def beehive_group_params
    params.require(:beehive_group).permit(:name, :user_id, :beehive_amount, :honey_amount)
  end
end
