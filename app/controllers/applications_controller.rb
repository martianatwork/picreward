class ApplicationsController < ApplicationController

  def new
    @application = Application.new
  end

  def create
    @campaign = Campaign.find(params[:campaign_id])
    @application = Application.new(application_params)
    @application.campaign = @campaign
    @application.influencer = Influencer.find_by_user_id(current_user)
    @application.status = "Pending"
    if @application.save
      flash[:notice] = "Congrats #{@influencer.username}, your application for #{@campaign.title} has been successfully created "
      redirect_to campaign_path(@campaign)
    else
      flash[:alert] = "Failed to create an application, try again"
      render :new
    end
  end

  def index
    @applications = Application.all
  end

  def show
    @application.campaign = @campaign
    @application = Application.find(params[:id])
    if @application == nil
      redirect_to campaign_path(@campaign)
    end
  end


  private

  def application_params
    params.require(:application).permit(:motivation)
  end

end
