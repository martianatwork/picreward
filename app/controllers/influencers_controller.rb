class InfluencersController < ApplicationController
  before_action :find_influencer, only: [:show, :edit, :destroy, :update]

  def index
    @influencers = Influencer.all
  end

  def show
    @influencer = Influencer.find(params[:id])
  end

  def new
    @influencer = Influencer.new
  end

  def create
    @influencer = Influencer.new(influencer_params)
    if @influencer.save
      flash[:notice] = "Successfully created #{@influencer.username}"
      redirect_to influencer_path(@influencer)
    else
      flash[:alert] = "Failed to create #{@influencer.username}"
      render :new
  end

  def edit
  end

  def destroy
    @influencer.destroy

    redirect_to influencers_path
  end

  def update
    @influencer.update(influencer_params)
    redirect_to influencer_path(@influencer)
  end

  private

  def influencer_params
    params.require(:influencer).permit(:first_name, :last_name, :address, :number)
  end

  def find_influencer
    @influencer = Influencer.find(params[:id])
  end
end
