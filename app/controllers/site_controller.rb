class SiteController < ApplicationController
  def index
    @media = Medium.order('created_at desc').page params[:page]
  end
end
