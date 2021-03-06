class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :businesses_home, :influencers_home]
  before_action :skip_authorization
  before_filter :disable_nav, only: [:home, :businesses_home, :influencers_home]
  before_filter :disable_footer, only: [:home]

  def home
  end

  def disable_nav
    @disable_nav = true
  end

  def disable_footer
    @disable_footer = true
  end
end
