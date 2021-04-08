module Admin
  class SheltersController < ApplicationController
    def index
      @shelters = Shelter.order_by_name_reverse
      @pending = Shelter.with_pending_applications
    end
  end
end
