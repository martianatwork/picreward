class ApplicationsController < ApplicationController
  before_action :find_application, only: [:show, :edit, :update]

  def index
    @applications = policy_scope(Application)
  end

  def show
    authorize @application
    @campaign = @application.campaign
    if @application == nil
      redirect_to campaign_path(@campaign)
    end

    # render :show, layout: false
  end

  def new
    @application = Application.new
    authorize @application
  end

  def create
    @influencer = Influencer.find_by_user_id(current_user)
    @campaign = Campaign.find(params[:campaign_id])
    @application = Application.new(application_params)
    authorize @application
    @application.campaign = @campaign
    @application.influencer = @influencer
    @application.status = "Pending"
    if @application.save
      flash[:notice] = "Thanks #{@influencer.username}, you've just applied for #{@campaign.title}. Your application is under review, we'll get back to you shortly"
      redirect_to campaign_path(@campaign)
    else
      flash[:alert] = "Failed to create an application, try again"
      redirect_to campaign_path(@campaign)
    end
  end

  def edit
    authorize @application
  end

  def update
    @application.update(application_params)
    authorize @application
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
