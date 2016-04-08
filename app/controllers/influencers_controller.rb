class InfluencersController < ApplicationController
  before_action :find_influencer, only: [:show, :edit, :destroy, :update]

  def index
    @influencers = policy_scope(Influencer)
  end

  def show
    authorize @influencer
  end

  def new
    @influencer = Influencer.new
    authorize @influencer
  end

  def create
    @influencer = Influencer.new(influencer_params)
    authorize @influencer
    if @influencer.save
      flash[:notice] = "Successfully created #{@influencer.username}"
      redirect_to influencer_path(@influencer)
    else
      flash[:alert] = "Failed to create #{@influencer.username}"
      render :new
    end
  end

  def edit
    authorize @influencer
  end

  def destroy
    @influencer.destroy
    authorize @influencer
    flash[:notice] = "Successfully deleted #{@influencer.username}"
    redirect_to root_path
  end

  def update
    @influencer.update(influencer_params)
    authorize @influencer
    redirect_to influencer_path(@influencer)
  end

  private

  def influencer_params
    params.require(:influencer).permit(:first_name, :last_name, :address, :number, :photo, :photo_cache)
  end

  def find_influencer
    @influencer = Influencer.find(params[:id])
  end
end
