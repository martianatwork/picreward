class CampaignsController < ApplicationController
  before_action :find_campaign, only: [:show, :edit, :update]

  def index
    @campaigns = Campaign.all
  end

  def show
  end

  def new
    @campaign = Compaign.new
  end

  def create
    @campaign = Campaign.new(campaign_params)
    if @campaign.save
      flash[:notice] = "Successfully created #{Campaign.title}"
      redirect_to campaign_path(@campaign)
    else
      flash[:alert] = "Failed to create #{Campaign.title}"
      render :new
    end
  end

  def edit
  end


  def update
    @campaign.update(campaign_params)
    redirect_to campaign_path(@campaign)
  end

  private

  def campaign_params
    params.require(:campaign).permit(:title, :product, :goal, :start_time, :end_time, :description, :instructions, :budget, :pics_to_upload, :pics_to_post, :photo, :photo_cache)
  end

  def find_campaign
    @campaign = Campaign.find(params[:id])
  end
end
