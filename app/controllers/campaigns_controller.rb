class CampaignsController < ApplicationController
  before_action :find_campaign, only: [:show, :edit, :update]

  def index
    @campaigns = policy_scope(Campaign)
    @paid_jobs = Campaign.where(reward_type: "Paid Job")
    @local_swaps = Campaign.where(reward_type: "Local Swap")
    @markers = Gmaps4rails.build_markers(@local_swaps) do |campaign, marker|
      marker_url = view_context.image_path("marker.png")
      marker.lat campaign.latitude
      marker.lng campaign.longitude
      marker.picture({
        url: marker_url,
        width: 32,
        height: 32
       })
      marker.infowindow render_to_string(:partial => "/campaigns/map_box", locals: {campaign: campaign})
    end
  end

  def show
    authorize @campaign
    @application = Application.new
    @marker = Gmaps4rails.build_markers(@campaign) do |campaign, marker|
      marker_url = view_context.image_path("marker.png")
      marker.lat campaign.latitude
      marker.lng campaign.longitude
      marker.picture({
        url: marker_url,
        width: 32,
        height: 32
       })
      marker.infowindow render_to_string(:partial => "/campaigns/map_box", locals: {campaign: campaign})
    end
  end

  def new
    @campaign = Campaign.new
    authorize @campaign
  end

  def create
    @campaign = Campaign.new(campaign_params)
    authorize @campaign
    if @campaign.save
      flash[:notice] = "Successfully created #{@campaign.title}"
      redirect_to campaign_path(@campaign)
    else
      flash[:alert] = "Failed to create #{@campaign.title}"
      render :new
    end
  end

  def edit
    authorize @campaign
  end


  def update
    @campaign.update(campaign_params)
    authorize @campaign
    redirect_to campaign_path(@campaign)
  end

  private

  def campaign_params
    params.require(:campaign).permit(:target_location, :reward_type, :title, :product, :goal, :start_time, :end_time, :description, :instructions, :budget, :pics_to_upload, :pics_to_post, :photo, :photo_cache)
  end

  def find_campaign
    @campaign = Campaign.find(params[:id])
  end
end
