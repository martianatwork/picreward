class BusinessesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :find_business_id, only: [:show, :edit, :update, :destroy]

  def index
    @businesses = policy_scope(Business)
  end

  def new
    @business = Business.new
    authorize @business
  end

  def create
    @business = current_user.businesses.new(business_params)
    authorize @business
    if @business.save
      flash[:notice] = "Welcome Aboard, #{@business.name}!"
      redirect_to business_path(@business)
    else
      flash[:alert] = "Invalid parameters, try again"
      render :new
    end
  end

  def show
    if @business == nil
      redirect_to businesses_new_path
    end
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

  def find_business_id
    @business = Business.find_by_user_id(current_user)
  end

  def business_params
    params.require(:business).permit(:name, :address, :category, :tva, :contact_name, :logo)
  end
end
