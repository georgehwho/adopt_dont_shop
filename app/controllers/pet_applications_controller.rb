class PetApplicationsController < ApplicationController
  protect_from_forgery with: :null_session

  def create
    application = Application.find(params[:application_id])
    pet = Pet.find(params[:pet_id])
    application.pets << pet
    redirect_to "/applications/#{params[:application_id]}"
  end

  def update
    @application = Application.find(params[:application_id])
    pet_app = PetApplication.where(pet_id: params[:pet_id], application_id: @application.id)
    pet_app.update(status: params[:status_update])

    if @application.no_pets_pending?
      @application.update(status: "Accepted") if @application.all_pets_accepted?
      @application.update(status: "Rejected") if @application.any_pets_rejected?
      redirect_to admin_app_path(@application)
    else
      redirect_to admin_app_path(@application)
    end
  end
end