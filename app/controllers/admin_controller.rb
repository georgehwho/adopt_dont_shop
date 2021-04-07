class AdminController < ApplicationController
  def shelters
    @shelters = Shelter.order_by_name_reverse
    @pending = Shelter.with_pending_applications
  end

  def app_show
    @application = Application.find(params[:app_id])
  end
end