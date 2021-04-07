class ApplicationsController < ApplicationController
  def show
    @application = Application.find(params[:id])
    if params[:search].present?
      @pets = Pet.adoptable.search(params[:search])
    else
      @pets = Pet.adoptable
    end
  end

  def new
  end

  def create
    application = Application.new(application_params)

    if application.save
      redirect_to "/applications/#{application.id}"
    else
      redirect_to "/applications/new"
      flash[:alert] = "Error: #{error_message(application.errors)}"
    end
  end

  def update
    application = Application.find(params[:id])
    params[:status] = "Pending"
    if application.update(application_params.merge(:submit_app => true))
      redirect_to "/applications/#{application.id}"
    else
      redirect_to "/applications/#{application.id}"
      flash[:alert] = "Error: #{error_message(application.errors)}"
    end
  end

  private

  def application_params
    params.permit(:id, :name, :address, :city, :state, :zip_code, :description, :status)
  end
end