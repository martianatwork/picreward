class CampaignsController < ApplicationController
  before_action :find_campaign, only: [:show, :edit, :update]

  def index
    @campaigns = Campaign.all
    # @local_campaigns = Campaign.where(reward_type: "Local")
    @local_campaigns = Campaign.find("4")
    @markers = Gmaps4rails.build_markers(@local_campaigns) do |campaign, marker|
      marker.lat campaign.latitude
      marker.lng campaign.longitude
      marker.infowindow render_to_string(:partial => "/campaigns/map_box", locals: {campaign: campaign})
    end
  end

  def show
  end

  def new
    @campaign = Campaign.new
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
