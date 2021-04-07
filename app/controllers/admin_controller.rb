class AdminController < ApplicationController
  def shelters
    @shelters = Shelter.order_by_name_reverse
    @pending = Shelter.with_pending_applications
  end

  def app_show
    @application = Application.find(params[:app_id])
  end

  def app_update
    application = Application.find(params[:app_id])

    if application.update(application_params)
      redirect_to admin_app_path(application)
    else
      redirect_to admin_app_path(application)
      flash[:alert] = "Error: #{error_message(application.errors)}"
    end
  end

  private

  def application_params
    params.permit(:id, :name, :address, :city, :state, :zip_code, :description, :status)
  end
end