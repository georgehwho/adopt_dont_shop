class AdminController < ApplicationController
  def shelters
    @shelters = Shelter.order_by_name_reverse
    @pending = Shelter.with_pending_applications
  end
end