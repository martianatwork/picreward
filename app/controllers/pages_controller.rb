class PagesController < ApplicationController
 before_filter :disable_nav, only: [:home]
  def home
  end

  def disable_nav
  @disable_nav = true
  end

end
