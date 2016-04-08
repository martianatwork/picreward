class BusinessesController < ApplicationController
  before_action :find_business, only: [:show, :edit, :update, :destroy]

  def index
    @businesses = policy_scope(Business)
  end

  def new
    @business = Business.new
    authorize @business
  end

  def create
    @business = Business.new(business_params)
    @business.user = current_user
    authorize @business
    if @business.save
      flash[:notice] = "Welcome Aboard, #{@business.name}!"
      redirect_to business_path(@business)
    else
      flash[:alert] = "Invalid parameters, try again"
      redirect_to new_business_path
    end
  end

  def show
    authorize @business
  end

  def edit
    authorize @business
  end

  def update
    @business.update(business_params)
    authorize @business
    redirect_to business_path(@business)
  end

  def destroy
    @business.destroy
    authorize @business
    flash[:notice] = "Bye #{@business.name}, All the best!"
    redirect_to root_path
  end


  private

  def find_business
    @business = Business.find_by_user_id(current_user)
  end

  def business_params
    params.require(:business).permit(:name, :address, :category, :tva, :contact_name, :photo, :photo_cache)
  end
end
