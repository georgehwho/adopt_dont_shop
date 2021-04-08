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
      if @application.all_pets_accepted?
        # @application.pets.each { |pet| pet.toggle_adoptable }
        pets = Pet.select("pets.*").joins(:applications).where("applications.id=#{@application.id}")
        pets.each {|pet| pet.toggle_adoptable }
        @application.update(status: "Accepted")
      end

      if @application.any_pets_rejected?
        @application.update(status: "Rejected")
      end
    end
    render "/admin/app_show"
  end
end