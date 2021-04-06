class PetApplicationsController < ApplicationController
  protect_from_forgery with: :null_session

  def create
    application = Application.find(params[:application_id])
    pet = Pet.find(params[:pet_id])
    application.pets << pet
    redirect_to "/applications/#{params[:application_id]}"
  end
end