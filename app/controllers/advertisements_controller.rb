class AdvertisementsController < ApplicationController
  before_filter :check_admin!

  def new
  end

  def create
    Advertisement.create(params[:advertisement])
    redirect_to :root, notify: 'Successfully uploaded ad'
  end

  private
    def check_admin!
      redirect_to :root unless current_user.admin
    end
end
