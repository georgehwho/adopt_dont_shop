module Admin
  class SheltersController < ApplicationController
    def index
      @shelters = Shelter.order_by_name_reverse
      @pending = Shelter.with_pending_applications
    end

    def show
      @shelter = Shelter.find(params[:id])
      @shelter_info = @shelter.full_address
    end
  end
end
