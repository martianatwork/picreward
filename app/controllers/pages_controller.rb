class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :businesses_home, :influencers_home]
  before_action :skip_authorization

end
