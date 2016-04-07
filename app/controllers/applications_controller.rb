class ApplicationsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :find_application, only: [:show, :edit, :update]

  def new
    @application = Application.new
  end

  def create
    @influencer = Influencer.find_by_user_id(current_user)
    @campaign = Campaign.find(params[:campaign_id])
    @application = Application.new(application_params)
    @application.campaign = @campaign
    @application.influencer = @influencer
    @application.status = "Pending"
    if @application.save
      flash[:notice] = "Thanks #{@influencer.username}, you've just applied for #{@campaign.title}. Your application is under review, we'll get back to you shortly"
      redirect_to campaign_path(@campaign)
    else
      flash[:alert] = "Failed to create an application, try again"
      render :new
    end
  end

  def index
    # @campaign = Campaign.find(params[:campaign_id])
    @applications = Application.all
  end

  def show
    @campaign = Campaign.find(params[:campaign_id])
    if @application == nil
      redirect_to campaign_path(@campaign)
    end
  end

  def edit
  end

  def update
    @application.update(application_params)
    redirect_to campaign_application_path(@application.campaign, @application)
  end

  private

  def application_params
    params.require(:application).permit(:motivation, :status)
  end

  def find_application
    @application = Application.find(params[:id])
  end

end
