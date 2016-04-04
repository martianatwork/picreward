class BusinessesController < ApplicationController
  before_action :find_business_id, only: [:show, :edit, :update, :destroy]

  def new
    @business = Business.new
  end

  def create
    @business = Business.new(business_params)
    @business.user = current_user.id
    if @business.save
      flash[:notice] = "Welcome Aboard, #{@business.name}!"
      redirect_to businesses_show_path(@business)
    else
      flash[:alert] = "Invalid parameters, try again"
      render :new
    end
  end

  def index
    @businesses = Business.all
  end

  def show
    if @business == nil
      redirect_to businesses_new_path
    end
  end

  def edit
  end

  def update
    @business.update(business_params)
    redirect_to businesses_show_path(@business)
  end

  def destroy
    @business.destroy
    flash[:notice] = "Bye #{@business.name}, All the best!"
    redirect_to root_path
  end


  private

  def find_business_id
    @business = Business.find_by_user_id(current_user)
  end

  def business_params
    params.require(:business).permit(:name, :adress, :category, :tva, :contact_name, :logo)
  end
end
