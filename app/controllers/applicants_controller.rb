class ApplicantsController < ApplicationController
  before_action :set_applicant, only: [:show]

  def show
  end

  private

  def applicant_params
    params.permit(:name, :address, :city, :state, :zip_code, :description, :status)
  end

  def set_applicant
    @applicant = Applicant.find(params[:id])
  end
end