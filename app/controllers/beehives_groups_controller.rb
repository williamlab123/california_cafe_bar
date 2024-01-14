class BeehivesGroupsController < AuthenticatedController
  def create
    @beehives_groups = BeehiveGroup.new(beehives_group_params)
    @beehives_groups.user = User.find(session[:user_id]) if session[:user_id]
    if @beehives_groups.save
      redirect_to beehives_groups_url
    else
      puts @beehives_groups.errors.full_messages
      render :new
    end
  end

  def index
    @beehives_groups = BeehiveGroup.where(user_id: session[:user_id])
  end

  def new
    @beehive_group = BeehiveGroup.new
  end

  def collect
    @beehive_group = BeehiveGroup.find(params[:id])
    @beehive_group.collect
    redirect_to beehives_groups_path
  end
  
  def destroy
    @beehives_groups = BeehiveGroup.find(params[:id])
    @beehives_groups.destroy
    redirect_to beehives_group_url
  end

  private

  def beehives_group_params
    params.require(:beehive_group).permit(:name, :user_id, :beehive_amount)
  end
end
